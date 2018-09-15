# Commands
PDFTEX = pdflatex -synctex=1 -interaction=nonstopmode
BIBTEX = bibtex
CREATE = touch
RM     = rm -rf

# Targets and Dependencies
FILE     = plan
DEPS     = ref.bib Chapter/*.tex

TMPFILES = $(FILE).aux \
           $(FILE).bbl \
           $(FILE).blg \
           $(FILE).loa \
           $(FILE).lof \
           $(FILE).log \
           $(FILE).lot \
           $(FILE).nav \
           $(FILE).out \
           $(FILE).snm \
           $(FILE).toc \
	   $(FILE).dvi \
	   $(FILE).synctex.gz
	  
LOGFILES = latex[1-4].log \
           bibtex.log

# Functions
clean_tmp = $(RM) $(TMPFILES) && echo "CLEAN $(TMPFILES)"

clean_log = $(RM) $(LOGFILES) && echo "CLEAN $(LOGFILES)"

err_latex = $(call clean_tmp) && ./print_error.sh latex$(1).log && false
err_bibtx = $(call clean_tmp) && ./print_error.sh bibtex.log && false

# Rules
.PHONY : default clean

default: $(FILE).done

$(FILE).done: $(FILE).tex $(DEPS) Makefile
	@echo "PDFTEX $(FILE) > latex1.log"
	@$(PDFTEX) $(FILE) > latex1.log || ($(call err_latex,1))

	@echo "BIBTEX $(FILE) > bibtex.log"
	@$(BIBTEX) $(FILE) > bibtex.log || ($(call err_bibtx))

	@echo "PDFTEX $(FILE) > latex2.log"
	@$(PDFTEX) $(FILE) > latex2.log || ($(call err_latex,2))

	@echo "PDFTEX $(FILE) > latex3.log"
	@$(PDFTEX) $(FILE) > latex3.log || ($(call err_latex,3))

	@echo "PDFTEX $(FILE) > latex4.log"
	@$(PDFTEX) $(FILE) > latex4.log || ($(call err_latex,4))

	@echo "CREATE $(FILE).done"
	@$(CREATE) $(FILE).done

	@$(call clean_tmp)
	@$(call clean_log)

clean:
	@$(call clean_tmp)
	@$(call clean_log)
	@echo "CLEAN $(FILE).pdf $(FILE).done"
	@$(RM) $(FILE).pdf $(FILE).done

