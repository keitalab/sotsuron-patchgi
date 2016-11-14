build:
	platex temp.tex && dvipdfmx temp

open:
	open temp.pdf

clean:
	rm *.log *.dvi *.aux *.toc
