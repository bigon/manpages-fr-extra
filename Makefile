SUBDIRS=at bash coreutils cron diffutils findutils glibc grep lilo most \
	nfs-utils procps tar util-linux

#  Must be an absolute path!
INSTDIR = $(CURDIR)/man

all: build stats

build: build-stamp
build-stamp:
	@for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir; \
	done
	touch $@

clean:
	@for dir in $(SUBDIRS); do \
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
	@for dir in $(SUBDIRS); do \
	  [ -d $$dir/fr ] || continue; \
	  cd $$dir/fr; \
	  for f in man*/*; do \
	    [ -f $$f ] || continue; \
	    d=$(INSTDIR)/`dirname $$f`; \
	    [ -d $$d ] || mkdir $$d; \
	    iconv -f utf8 -t latin1 $$f > $(INSTDIR)/$$f || exit 1; \
	  done; \
	  cd ../..; \
	done

