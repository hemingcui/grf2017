SRC = proposal
FILES = proposal.toc proposal.bbl proposal.aux proposal.blg proposal.dvi *.log proposal.ps proposal.pdf *~

all:: bbl proposal

proposal: *.tex bib2/biblio.bib figures/*.eps code/*.tex
	# dvipdf proposal.dvi
	# dvips -o proposal.ps -t letter proposal.dvi
	pdflatex reference.tex
	pdflatex appendix.tex
	pdflatex reference.tex
	#	test -e p.pdf || ln -s $(SRC).pdf p.pdf

bbl:
	rm -rf proposal.bbl
	pdflatex  $(SRC) 2>&1 > $(SRC).build.log
	bibtex  $(SRC) 2>&1 >> $(SRC).build.log
	pdflatex  $(SRC) 2>&1 >> $(SRC).build.log
	pdflatex  $(SRC) 2>&1 >> $(SRC).build.log

clean:
	rm -f $(FILES)
