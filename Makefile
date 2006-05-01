SUBDIRS=at coreutils cron diffutils grep lilo procps tar util-linux

all: build stats

build:
	@for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir; \
	done;

clean:
	@for dir in $(SUBDIRS); do \
	  $(MAKE) clean -C $$dir; \
	done;
	@rm -rf man/

stats:
	@for dir in $(SUBDIRS); do \
	  $(MAKE) stats -s -C $$dir; \
	done;

install: build
	@echo "Note: This is not a 'real' install target."
	mkdir -p man/
	@for dir in $(SUBDIRS); do \
	  if [ -d $$dir/french/ ]; then \
	    cp -r $$dir/french/* man/; \
	  fi; \
	done;
