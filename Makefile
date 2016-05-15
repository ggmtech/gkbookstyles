#my Makefile for compiling GK

RWFwheels.tex: RWFwheels.tex gkbookm1.cls chp/*.tex
	pdflatex RWFwheels.tex
	pdflatex RWFwheels.tex

