PACKAGE=lilo

include ../Makefile.common

post-build:
	if [ -e french/man8/lilo.8 ]; then \
	  ln -sf lilo.8 french/man8/lilo.real.8; \
	fi;
	if [ -e french/man8/liloconfig.8 ]; then \
	  ln -sf liloconfig.8 french/man8/update-lilo.8; \
	fi;
