SUBDIRS=at coreutils cron diffutils grep lilo procps tar util-linux

build:
	for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir; \
	done;

clean:
	for dir in $(SUBDIRS); do \
	  $(MAKE) clean -C $$dir; \
	done;
