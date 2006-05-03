#! /bin/sh

for i in man*/* ; do
	iconv -t LATIN1 -f UTF8 < $i > tmp
	mv tmp $i
done

