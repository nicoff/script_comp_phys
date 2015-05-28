# $Id: Makefile 768 2008-07-12 19:14:25Z doerr $

all: dipse.pdf dipse.dvi

dipse.dvi: dipse.tex
	latex dipse
	bibtex dipse
	latex dipse
	bibtex dipse
	latex dipse


pdf: dipse.tex
	pdflatex dipse
	bibtex dipse
	pdflatex dipse
	pdflatex dipse
	rm -f *.out *.bbl *.aux *.log *.dvi dipse-blx.bib *~  *.toc *.blg
	find . -name "*.aux" -print0 | xargs -0 rm -rf
	rm -f dipse.dvi dipse.ps

clean:
	rm -f *.out *.bbl *.aux *.log *.dvi dipse-blx.bib *~  *.toc *.blg
	find . -name "*.aux" -print0 | xargs -0 rm -rf
	rm -f dipse.pdf dipse.dvi dipse.ps
	
distclean: clean
	rm -rf auto dipse.pdf

index: dipse.dvi
	makeindex dipse.nlo -s nomencl.ist -o dipse.nls

	
