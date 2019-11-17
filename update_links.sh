#!/usr/bin/env bash

#----------------------------------------------------------------------------------
# Project Name      - i3Config/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Mon 13 May 01:28:23 BST 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#------------------------------------------------------------------------------MAIN

FAIL(){
	printf "[L%0.4d] ERROR: %s\n" "$2" "$3" 1>&2
	[ $1 -eq 1 ] && exit 1
}

declare -i DEPCOUNT=0
for DEP in ln rm; {
	if ! type -fP "$DEP" > /dev/null 2>&1; then
		FAIL 0 "$LINENO" "Dependency '$DEP' not met."
		DEPCOUNT+=1
	fi
}

[ $DEPCOUNT -eq 0 ] || exit 1

if ! [ "${PWD//*\/}" == "i3Config" ]; then
	FAIL 1 "$LINENO" "Not in the repository's root directory."
fi

for FILE in .i3a/* ; {
	rm -v "$HOME/$FILE" 2>&-
	ln -v "$FILE" "$HOME/$FILE" 2>&-
}

CFILE="$HOME/.config/i3/config"
rm -v "$CFILE" 2>&-
ln -v config "$CFILE" 2>&-

CFILE="$HOME/.i3bbelow"
rm -v "$CFILE" 2>&-
ln -v .i3bbelow "$CFILE" 2>&-

CFILE="$HOME/.i3babove"
rm -v "$CFILE" 2>&-
ln -v .i3babove "$CFILE" 2>&-

CFILE="$HOME/.libi3bview"
rm -v "$CFILE" 2>&-
ln -v .libi3bview "$CFILE" 2>&-

