#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - i3Config/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Wed  4 Dec 22:39:21 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#------------------------------------------------------------------------------MAIN

Err(){
	printf "ERROR: %s\n" "$2" 1>&2
	[ $1 -gt 1 ] && exit $1
}

DepCount=0
for CurDep in ln rm; do
	if ! command -v "$CurDep" 1> /dev/null 2>&1; then
		Err 0 "Dependency '$CurDep' not met."
		DepCount=$((DepCount + 1))
	fi
done

[ $DepCount -eq 0 ] || exit 1

if ! [ "${PWD##*/}" = 'i3Config' ]; then
	Err 1 "Not in the repository's root directory."
fi

{
	for FILE in .i3a/*; do
		rm -v "$HOME/$FILE"
		ln -v "$FILE" "$HOME/$FILE"
	done

	CFILE="$HOME/.config/i3/config"
	rm -v "$CFILE"
	ln -v config "$CFILE"

	CFILE="$HOME/.i3bbelow"
	rm -v "$CFILE"
	ln -v .i3bbelow "$CFILE"

	CFILE="$HOME/.i3babove"
	rm -v "$CFILE"
	ln -v .i3babove "$CFILE"

	CFILE="$HOME/.libi3bview"
	rm -v "$CFILE"
	ln -v .libi3bview "$CFILE"
} 2> /dev/null
