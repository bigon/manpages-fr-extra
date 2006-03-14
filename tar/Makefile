# build: update po files if needed and generate manpages
#
# clean: update po files if needed and remove existing
#        generated manpages

PACKAGE=tar

PO4ADIR=po4a
PODIR=$(PO4ADIR)/po
PO4ACONFIGFILE=$(PO4ADIR)/$(PACKAGE).cfg

build:
	po4a $(PO4ACONFIGFILE)

clean:
	po4a --rm-translations $(PO4ACONFIGFILE)
	-rm -f $(PODIR)/*~
