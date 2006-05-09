SUBDIRS=at coreutils cron diffutils findutils grep lilo procps tar util-linux

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
	@rm -rf man/
	@rm -f build-stamp

stats:
	@for dir in $(SUBDIRS); do \
	  $(MAKE) stats -s -C $$dir; \
	done

install: build
	@echo "Note: This is not a 'real' install target."
	[ -d man ] || mkdir man
	@for dir in $(SUBDIRS); do \
	  [ -d $$dir/french ] || continue; \
	  cd $$dir/french; \
	  for f in man*/*; do \
	    [ -f $$f ] || continue; \
	    d=../../man/`dirname $$f`; \
	    [ -d $$d ] || mkdir $$d; \
	    iconv -f utf8 -t latin1 $$f > ../../man/$$f; \
	  done; \
	  cd ../..; \
	done

