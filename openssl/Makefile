PACKAGE=openssl
VERSION=$(shell cat VERSION | sed -e 's/-[0-9]*$$//')

PO4ADIR=po4a
PODIR=$(PO4ADIR)/po
PO4ACONFIGFILE=$(PO4ADIR)/$(PACKAGE).cfg

all: build

pre-build:

po4a-build:
	po4a --previous -L UTF-8 $(PO4ACONFIGFILE)

P2M = pod2man --utf8 --center="OpenSSL" --release="$(VERSION)"

post-build: man1 man3

man1:
	mkdir -p fr/man1 fr/man5
	@set -e; \
	for m in fr/apps/*.pod; do \
	sec=`$(PERL) ./extract-section.pl 1 < $$m`; \
		man=$$(basename $$m); \
		man=$${man%.pod}; \
		$(P2M) --section=$${sec}SSL $$m > fr/man$$sec/$$man.$${sec}ssl; \
	done

man3:
	mkdir -p fr/man3 fr/man7
	@set -e; \
	for m in fr/crypto/*.pod fr/ssl/*.pod; do \
	sec=`$(PERL) ./extract-section.pl 3 < $$m`; \
		man=$$(basename $$m); \
		man=$${man%.pod}; \
		$(P2M) --section=$${sec}SSL $$m > fr/man$$sec/$$man.$${sec}ssl; \
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
