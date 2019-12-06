#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - i3Config/devutils/links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Fri  6 Dec 15:57:21 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#------------------------------------------------------------------------------MAIN

. /usr/lib/tflbp-sh/ChkDep

ChkDep ln rm

cd "$HOME/GitHub/terminalforlife/Personal/i3Config"

{
	CFILE="$HOME/.config/i3/config"
	rm -v "$CFILE"
	ln -v source/config "$CFILE"

	for FILE in source/.i3a/*; do
		rm -v "$HOME/$FILE"
		ln -v "$FILE" "$HOME/$FILE"
	done
} 2> /dev/null
