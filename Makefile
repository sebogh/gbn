all: gbn.cls gbn.pdf test-simple.pdf test-complete.pdf

gbn.cls test-simple.tex test-complete.tex: gbn.dtx gbn.ins
	pdflatex gbn.ins

gbn.pdf: gbn.dtx
	pdflatex gbn.dtx 
	pdflatex gbn.dtx

test-simple.pdf: gbn.cls test-simple.tex
	pdflatex test-simple.tex
	pdflatex test-simple.tex

test-complete.pdf: gbn.cls test-complete.tex
	pdflatex test-complete.tex
	pdflatex test-complete.tex

clean:
	rm -f *.aux *.glo *.idx *.log *.out *~

tidy: clean
	rm -f gbn.cls test-simple.tex test-complete.tex gbn.pdf test-simple.pdf test-complete.pdf
