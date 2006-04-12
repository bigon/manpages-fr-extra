PACKAGE=at

include ../Makefile.common

post-build:
	if [ -e french/man1/at.1 ]; then \
	  ln -sf at.1 french/man1/atq.1; \
	  ln -sf at.1 french/man1/atrm.1; \
	  ln -sf at.1 french/man1/batch.1; \
	fi;
	if [ -e french/man5/at.allow.5 ]; then \
	  ln -sf at.allow.5 french/man5/at.deny.5; \
	fi;
