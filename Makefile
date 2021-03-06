download:
	mkdir -p images
	cat body.md \
	| grep -e '!\[.*\](.*)' \
	| grep -o 'https\?://[^)]*' \
	| xargs -I{} /bin/bash -c 'wget {} -nc -P images; sed -ie "s|{}|images/`basename {}`|g" body.md'

convert: download
	pandoc body.md -o body.tex
	sed -ie 's/includegraphics/includegraphics[width=\\textwidth,height=5cm,keepaspectratio]/g' body.tex
	cat body.tex \
	| grep -o 'images/[^}]*' \
	| xargs -I{} /bin/bash -c 'sed -ie "1,/\\\end{figure}/s/\\\end{figure}/\\\label{fig:`basename {}`}\\\end{temp_fig}/g" body.tex'
	sed -ie "s/\\\end{temp_fig}/\\\end{figure}/g" body.tex
	sed -ie "s|\\\begin{figure}|\\\begin{figure}[h]|g" body.tex

build:
	platex temp.tex && platex temp.tex && platex temp.tex && dvipdfmx temp

open:
	open temp.pdf

clean:
	rm *.log *.dvi *.aux *.toc *.mde *.texe

title:
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=sotsuron.pdf title.pdf temp.pdf

