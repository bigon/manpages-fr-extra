# build: update po files if needed and generate manpages
#
# clean: update po files if needed and remove existing
#        generated manpages

PACKAGE=coreutils

PO4ADIR=po4a
PODIR=$(PO4ADIR)/po
PO4ACONFIGFILE=$(PO4ADIR)/$(PACKAGE).cfg

build:
	po4a $(PO4ACONFIGFILE)
#	$(shell ln -s test.1 french/man1/[.1)
	$(shell ln -s md5sum.1 french/man1/md5sum.textutils.1)

clean:
	po4a --rm-translations $(PO4ACONFIGFILE)
	-rm -f $(PODIR)/*~
