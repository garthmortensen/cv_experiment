# Local + CI build. Requires pandoc, pdflatex, poppler-utils (pdfinfo/pdftotext).
SRC     := src/cv.md
OUT     := build
NAME    := cv_garthmortensen
FILTER  := --lua-filter=scripts/cv.lua
# Page layout: one of the templates in site/ (ladder, sidebar, layered)
VARIANT ?= ladder
# GoatCounter site code (e.g. make GOATCOUNTER=garthy); empty = no analytics
GOATCOUNTER ?=

PANDOC_HTML = pandoc $(SRC) $(FILTER) -t html5 --standalone --section-divs \
  $(if $(GOATCOUNTER),-M goatcounter=$(GOATCOUNTER))

.PHONY: all site compare pdf docx check clean
all: site pdf docx check

site:
	mkdir -p $(OUT)/site
	$(PANDOC_HTML) --template=site/$(VARIANT).html -o $(OUT)/site/index.html
	cp -r site/assets $(OUT)/site/

# Build every template side by side: build/compare/<variant>.html
compare:
	mkdir -p $(OUT)/compare
	for t in site/*.html; do v=$$(basename $$t .html); \
	  $(PANDOC_HTML) --template=$$t -o $(OUT)/compare/$$v.html; done
	cp -r site/assets $(OUT)/compare/

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
