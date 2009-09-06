PACKAGE=openssl
VERSION=$(shell cat VERSION | sed -e 's/-[0-9]*$$//')

PO4ADIR=po4a
PODIR=$(PO4ADIR)/po
PO4ACONFIGFILE=$(PO4ADIR)/$(PACKAGE).cfg

all: build

pre-build:

po4a-build:
	po4a --previous $(PO4ACONFIGFILE)

P2M = pod2man --utf8 --center="OpenSSL" --release="$(VERSION)"

post-build: man1 man3

man1:
	mkdir -p fr/man1
	@set -e; \
	for m in fr/apps/*.pod; do \
		man=$$(basename $$m); \
		man=$${man%.pod}; \
		$(P2M) --section=1SSL $$m > fr/man1/$$man.1ssl; \
	done

man3:
	mkdir -p fr/man3
	@set -e; \
	for m in fr/crypto/*.pod fr/ssl/*.pod; do \
		man=$$(basename $$m); \
		man=$${man%.pod}; \
		$(P2M) --section=3SSL $$m > fr/man3/$$man.3ssl; \
	done

build: pre-build po4a-build post-build

clean:
	po4a --previous --rm-translations $(PO4ACONFIGFILE)
	-rm -rf fr
	-rm -f $(PODIR)/*/*~

stats-all:
	@echo -n "$(PACKAGE): "
	@set -e; \
	for f in $(PODIR)/fr/*.pod.po; do \
		echo "  $$f"; \
		msgfmt --statistics -c -o /dev/null $$f; \
	done

stats:
	@echo -n "$(PACKAGE): "
	@msgcat --use-first $(PODIR)/fr/*.pod.po | msgfmt --statistics -c -o /dev/null -
