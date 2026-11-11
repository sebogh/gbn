all: gbn.cls gbn.pdf test-simple.pdf test-complete.pdf

gbn.cls test-simple.tex test-complete.tex: gbn.dtx gbn.ins
	pdflatex gbn.ins

gbn.pdf: gbn.dtx
	pdflatex gbn.dtx 
	pdflatex gbn.dtx

test-simple.pdf: gbn.cls test-simple.tex
	xelatex test-simple.tex
	xelatex test-simple.tex

test-complete.pdf: gbn.cls test-complete.tex
	xelatex test-complete.tex
	xelatex test-complete.tex

# README-Bild: Beispiel aus README.md (erster latex-Block) übersetzen und zuschneiden
intro.tex: README.md
	awk '/^```latex$$/{f=1;next} /^```$$/{if(f)exit} f' README.md > $@

intro.pdf: gbn.cls intro.tex
	xelatex intro.tex
	xelatex intro.tex

intro.png: intro.pdf intro.py
	python3 intro.py intro.pdf intro.png

TEXMFHOME ?= $(shell kpsewhich -var-value TEXMFHOME)

install: gbn.cls gbn.pdf
	install -Dm644 gbn.cls $(TEXMFHOME)/tex/latex/gbn/gbn.cls
	install -Dm644 gbn.pdf $(TEXMFHOME)/doc/latex/gbn/gbn.pdf

.PHONY: all install clean tidy

clean:
	rm -f *.aux *.glo *.hd *.idx *.log *.out *~

tidy: clean
	rm -f gbn.cls test-simple.tex test-complete.tex intro.tex gbn.pdf test-simple.pdf test-complete.pdf
