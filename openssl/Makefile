PACKAGE=openssl
VERSION=$(shell cat VERSION | sed -e 's/-[0-9]*$$//')

PO4ADIR=po4a

all: build

pre-build:

po4a-build:
	for i in $(PO4ADIR)/*.cfg; do \
		po4a --previous -L UTF-8 $$i; \
	done

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
	for i in $(PO4ADIR)/*.cfg; do \
		po4a --previous --rm-translations $$i; \
	done
	-rm -rf fr
	-rm -f $(PO4ADIR)/*/po/*~

stats-all:
	@echo -n "$(PACKAGE): "
	@set -e; \
	for f in $(PO4ADIR)/*/po/fr.po; do \
		echo "  $$f"; \
		msgfmt --statistics -c -o /dev/null $$f; \
	done

stats:
	@echo -n "$(PACKAGE): "
	@msgcat --use-first $(PO4ADIR)/*/po/fr.po | msgfmt --statistics -c -o /dev/null -
