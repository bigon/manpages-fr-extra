#! /bin/sh

for i in man*/* ; do
	iconv -f LATIN1 -t UTF8 < $i > tmp
	mv tmp $i
done

