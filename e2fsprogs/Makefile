PACKAGE=e2fsprogs

include ../Makefile.common

check-links:
	@cat links | while read LINK TARGET; do \
	    $(call check_link,$$TARGET,$$LINK); \
	done; \
