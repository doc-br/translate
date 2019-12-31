#!/bin/sh
#
# Script to translate .po files into SGML
#

set -x

echo "Path: $PATH"

if [ "$1" = "" ]; then
	echo "Need to inform a FreeBSD doc repository"
	echo "Example:"
	echo
	echo "$0 ../freebsd-doc/pt_BR.ISO8859-1"
	echo
	exit 1
fi

for article in $(find "$1/articles/" -type d -maxdepth 1 -mindepth 1); do
	cd "$article"
	if [ -f ".do_not_translate" ]; then
		cd -
		continue
	fi
	make tran
	cd -
done

for book in $(find "$1/books/" -type d -maxdepth 1 -mindepth 1); do
	cd "$book"
	if [ -f ".do_not_translate" ]; then
		cd -
		continue
	fi
	make tran
	cd -
done

