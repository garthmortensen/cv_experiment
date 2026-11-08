# Local + CI build. Requires pandoc, pdflatex, poppler-utils (pdfinfo/pdftotext).
SRC       := README.md
TITLE     := Garth Mortensen — CV
OUT       := build
NAME      := cv_garthmortensen
FILTER    := --lua-filter=scripts/cv.lua
# GoatCounter site code (e.g. make GOATCOUNTER=garthy); empty = no analytics
GOATCOUNTER ?=

.PHONY: all site pdf docx check clean
all: site pdf docx check

site:
	mkdir -p $(OUT)/site
	pandoc $(SRC) $(FILTER) -t html5 --standalone --section-divs \
	  --template=site/template.html -M pagetitle="$(TITLE)" \
	  $(if $(GOATCOUNTER),-M goatcounter=$(GOATCOUNTER)) -o $(OUT)/site/index.html
	cp -r site/assets $(OUT)/site/

pdf:
	mkdir -p $(OUT)
	pandoc $(SRC) $(FILTER) -o $(OUT)/$(NAME).pdf --pdf-engine=pdflatex \
	  -V geometry:margin=0.7in -V fontsize=10pt \
	  -V colorlinks:true -V linkcolor:blue -V urlcolor:blue

docx:
	mkdir -p $(OUT)
	pandoc $(SRC) $(FILTER) -o $(OUT)/$(NAME).docx

check:
	scripts/check.sh $(OUT)/$(NAME).pdf $(OUT)/$(NAME).docx

clean:
	rm -rf $(OUT)
