PACKAGE=grep

include ../Makefile.common

post-build:
	if [ -e french/man1/grep.1 ]; then \
	  ln -sf grep.1 french/man1/egrep.1; \
	  ln -sf grep.1 french/man1/fgrep.1; \
	  ln -sf grep.1 french/man1/rgrep.1; \
	fi
