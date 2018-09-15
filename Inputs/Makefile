#
# UFRGS TeX Users Group
# $Id: Makefile,v 1.1.1.1 2005/01/18 23:54:34 avila Exp $
#

# DO NOT CHANGE
# This is the default user package directory, by installing here
# there is no need to run mktexlsr or to use sudo
DEFAULT_INSTALLDIR = $(shell kpsewhich -var-value=TEXMFHOME)

# USER CONFIG
INSTALLDIR = $(DEFAULT_INSTALLDIR)

INPUTS = $(INSTALLDIR)/tex/latex/iiufrgs
DOC = $(INSTALLDIR)/doc/latex/iiufrgs
BIB = $(INSTALLDIR)/bibtex/bst

all:
	@echo "Type \`\`make install'' to install the package."
	@echo
	@echo "By default, files will be installed from $(DEFAULT_INSTALLDIR),"
	@echo "and the package can be found automatically by latex."
	@echo
	@echo "You can change this configuration altering the variable INSTALLDIR in Makefile,"
	@echo "in this case, it can be necessary to add the directory to the default path of latex,"
	@echo "typing \`\`make add_to_latex_default_path\`\` after installation."
	@echo

install:
	install -d $(INPUTS) $(DOC) $(BIB)
	cp -R inputs/* $(INPUTS)
	cp README.org COPYING CHANGELOG $(DOC)
	@echo
	@echo "Files installed with success in em $(INSTALLDIR)."
	@echo
	@echo "In case latex can not find the package, run:"
	@echo "make add_to_latex_default_path"
	@echo

add_to_latex_default_path: $(INSTALLDIR)/tex/latex/iiufrgs
	ln -sf $(INSTALLDIR)/tex/latex/iiufrgs /usr/local/share/texmf/tex/latex/
	mktexlsr
