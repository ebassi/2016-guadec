HOVERCRAFT = $(shell which hovercraft)
ZIP = $(shell which zip)

NAME = $(basename $(shell pwd))
SRCFILE = 2016-guadec.rst
CSSFILE = $(SRCFILE:.rst=.css)
ZIPFILE = $(SRCFILE:.rst=.zip)

OUTPUTDIR = $(basename $(SRCFILE))

all: slides

slides: $(SRCFILE)
	@echo '  GEN     $(NAME)'; $(HOVERCRAFT) $(SRCFILE) $(OUTPUTDIR)

clean:
	@rm -rf $(OUTPUTDIR)
	@rm -f $(ZIPFILE)

snapshot: slides
	@echo '  ZIP     $(ZIPFILE)'; $(ZIP) -q -r "$(ZIPFILE)" "$(OUTPUTDIR)"

release: slides
	@echo '  ZIP     $(ZIPFILE)'; $(ZIP) -q -r "$(ZIPFILE)" "$(OUTPUTDIR)" $(SRCFILE) $(CSSFILE) Makefile

show: all
	@xdg-open $(OUTPUTDIR)/index.html
