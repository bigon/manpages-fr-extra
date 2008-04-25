PACKAGE=openssl
VERSION=$(shell cat VERSION)

PO4ADIR=po4a
PODIR=$(PO4ADIR)/po
PO4ACONFIGFILE=$(PO4ADIR)/$(PACKAGE).cfg

all: build

pre-build:

po4a-build:
	po4a --previous $(PO4ACONFIGFILE)

P2M = pod2man --center="OpenSSL" --release="$(VERSION)"

post-build: man1 man3

man1:
	mkdir -p fr/man1
	@set -e; \
	for m in fr/apps/*.pod; do \
		man=$$(basename $$m); \
		man=$${man%.pod}; \
		$(P2M) --section=1 $$m > fr/man1/$$man.1; \
	done

man3:
	mkdir -p fr/man3
	@set -e; \
	for m in fr/crypto/*.pod fr/ssl/*.pod; do \
		man=$$(basename $$m); \
		man=$${man%.pod}; \
		$(P2M) --section=3 $$m > fr/man3/$$man.3; \
	done

build: pre-build po4a-build post-build

clean:
	po4a --previous --rm-translations $(PO4ACONFIGFILE)
	-rm -rf fr
	-rm -f $(PODIR)/*/*~

stats:
	@echo -n "$(PACKAGE): "
	@set -e; \
	for f in $(PODIR)/fr/*.pod.po; do \
		echo "  $$f"; \
		msgfmt --statistics -c -o /dev/null $$f; \
	done

