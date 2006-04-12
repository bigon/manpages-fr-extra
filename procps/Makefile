PACKAGE=procps

include ../Makefile.common

post-build:
	if [ -e french/man1/pgrep.1 ]; then \
	  ln -sf pgrep.1 french/man1/pkill.1; \
	fi;
	if [ -e french/man1/snice.1 ]; then \
	  ln -sf skill.1 french/man1/snice.1; \
	fi;
