SUBDIRS=at \
	bash \
	coreutils cron \
	diffutils dosfstools \
	e2fsprogs eglibc \
	findutils \
	grep \
	lilo \
	most \
	nfs-utils \
	openssl \
	procps \
	reiser4progs reiserfsprogs \
	sysvinit \
	tar \
	util-linux \
	x11-xserver-utils

#  Must be an absolute path!
INSTDIR = $(CURDIR)/man

all: build stats

build: build-stamp
build-stamp:
	@set -e; \
	for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir; \
	done
	touch $@

clean:
	@set -e; \
	for dir in $(SUBDIRS); do \
	  $(MAKE) clean -C $$dir; \
	done
	@rm -rf $(INSTDIR)
	@rm -f build-stamp

stats:
	@for dir in $(SUBDIRS); do \
	  $(MAKE) stats -s -C $$dir; \
	done

install: build
	@echo "Note: This is not a 'real' install target."
	[ -d $(INSTDIR) ] || mkdir -p $(INSTDIR)
	@set -e; \
	for dir in $(SUBDIRS); do \
	  [ -d $$dir/fr ] || continue; \
	  cd $$dir/fr; \
	  for f in man*/*; do \
	    [ -f $$f ] || continue; \
	    d=$(INSTDIR)/`dirname $$f`; \
	    [ -d $$d ] || mkdir $$d; \
	    iconv -f utf8 -t latin1 $$f > /dev/null || exit 1; \
	    cp $$f $(INSTDIR)/$$f; \
	  done; \
	  cd ../..; \
	done

