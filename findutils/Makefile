PACKAGE=findutils

include ../Makefile.common

post-build: del-updatedb

# This manpages is also distributed by mlocate as updatedb.8
# This does not seem to be handled really nicely.
# This should be re-checked after translating the mlocate manpages.
del-updatedb:
	rm -f fr/man1/updatedb.findutils.1
