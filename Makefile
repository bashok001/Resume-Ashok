.PHONY: resume.pdf all clean
all: main

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

resume.pdf: ashok_resume.xtx
	latexmk -pdf -pdflatex="xelatex" -use-make ashok_resume.xtx

main: resume.pdf

clean:
	latexmk -CA ashok_resume.xtx
	rm -f ashok_resume.bbl
