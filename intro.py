"""Render the README screenshot: top and bottom of page 1, middle torn out.

Usage: python3 intro.py intro.pdf intro.png
Needs pdftoppm (poppler-utils) and Pillow (python3-pil).
"""
import subprocess
import sys
import tempfile
from pathlib import Path

from PIL import Image, ImageDraw, ImageFilter

DPI = 150
MM = DPI / 25.4
# Cut positions in mm from the top edge; chosen to fall between text lines
# of the README example (body ends at 106.4 mm, footer starts at 270 mm).
TOP_END = 108
BOTTOM_START = 262
GAP = 36  # px between the torn halves


def render(pdf):
    with tempfile.TemporaryDirectory() as tmp:
        out = Path(tmp) / "page"
        subprocess.run(["pdftoppm", "-png", "-r", str(DPI), "-singlefile",
                        "-f", "1", "-l", "1", pdf, str(out)], check=True)
        return Image.open(f"{out}.png").convert("RGBA")


def torn(img, edge, amp=7, period=28):
    """Cut a zigzag into the 'top' or 'bottom' edge of img."""
    w, h = img.size
    mask = Image.new("L", img.size, 255)
    half = period // 2
    pts = [(x, amp if (x // half) % 2 else 0) for x in range(0, w + period, half)]
    if edge == "bottom":
        pts = [(x, h - 1 - y) for x, y in pts]
    corner = 0 if edge == "top" else h
    ImageDraw.Draw(mask).polygon([(0, corner)] + pts + [(w, corner)], fill=0)
    img.putalpha(mask)
    return img


def with_shadow(img, blur=18, dy=8, pad=40):
    """Place img on a transparent canvas with drop shadow and hairline outline."""
    alpha = img.getchannel("A")
    canvas = Image.new("RGBA", (img.width + 2 * pad, img.height + 2 * pad))
    shadow = Image.new("RGBA", canvas.size)
    shadow.paste((0, 0, 0, 90), (pad, pad + dy), alpha)
    canvas.alpha_composite(shadow.filter(ImageFilter.GaussianBlur(blur)))
    outline = Image.new("RGBA", canvas.size)
    outline.paste((0, 0, 0, 40), (pad, pad), alpha)
    canvas.alpha_composite(outline)
    # paste the page 1px inset so the outline stays visible
    canvas.paste(img, (pad, pad), alpha.filter(ImageFilter.MinFilter(3)))
    return canvas


def main(pdf, png):
    page = render(pdf)
    w = page.width
    top = torn(page.crop((0, 0, w, round(TOP_END * MM))), "bottom")
    bottom = torn(page.crop((0, round(BOTTOM_START * MM), w, page.height)), "top")
    sheet = Image.new("RGBA", (w, top.height + GAP + bottom.height))
    sheet.alpha_composite(top)
    sheet.alpha_composite(bottom, (0, top.height + GAP))
    with_shadow(sheet).save(png, optimize=True)


if __name__ == "__main__":
    main(*sys.argv[1:3])
