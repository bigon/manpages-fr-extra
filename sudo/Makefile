PACKAGE=sudo
VERSION=$(shell cat VERSION | sed -e 's/-[0-9]*$$//')

PO4ADIR=po4a
PODIR=$(PO4ADIR)/po
PO4ACONFIGFILE=$(PO4ADIR)/$(PACKAGE).cfg

all: build

pre-build:

po4a-build:
	po4a --previous -L UTF-8 $(PO4ACONFIGFILE)

P2M = pod2man --utf8 --center="SUDO" --release="$(VERSION)"

post-build: man5 man8

man5:
	mkdir -p fr/man5
	@set -e; \
	for m in fr/sudoers.pod fr/sudoers.ldap.pod; do \
		man=$$(basename $$m); \
		man=$${man%.pod}; \
		$(P2M) --section=5 $$m > fr/man5/$$man.5; \
	done

man8:
	mkdir -p fr/man8
	@set -e; \
	for m in fr/sudo.pod fr/sudoreplay.pod fr/visudo.pod; do \
		man=$$(basename $$m); \
		man=$${man%.pod}; \
		$(P2M) --section=8 $$m > fr/man8/$$man.8; \
	done

build: pre-build po4a-build post-build

clean:
	po4a --previous --rm-translations $(PO4ACONFIGFILE)
	-rm -rf fr
	-rm -f $(PODIR)/*/*~

stats-all:
	@echo -n "$(PACKAGE): "
	@set -e; \
	for f in $(PODIR)/fr.po; do \
		echo "  $$f"; \
		msgfmt --statistics -c -o /dev/null $$f; \
	done

stats:
	@echo -n "$(PACKAGE): "
	@msgcat --use-first $(PODIR)/fr.po | msgfmt --statistics -c -o /dev/null -

