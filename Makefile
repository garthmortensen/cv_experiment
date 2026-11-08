# Local + CI build. Requires pandoc, pdflatex, poppler-utils (pdfinfo/pdftotext).
SRC     := src/cv.md
OUT     := build
NAME    := cv_garthmortensen
FILTER  := --lua-filter=scripts/cv.lua
# Set to your GoatCounter site code (e.g. make GOATCOUNTER=garthmortensen)
GOATCOUNTER ?=

.PHONY: all site pdf docx check clean
all: site pdf docx check

site:
	mkdir -p $(OUT)/site/assets
	pandoc $(SRC) $(FILTER) -t html5 --standalone --template=site/template.html \
	  $(if $(GOATCOUNTER),-M goatcounter=$(GOATCOUNTER)) -o $(OUT)/site/index.html
	cp site/assets/* $(OUT)/site/assets/

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
