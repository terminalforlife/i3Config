#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - i3Config/devutils/links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Fri  6 Dec 17:00:56 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#------------------------------------------------------------------------------MAIN

. /usr/lib/tflbp-sh/ChkDep

ChkDep ln rm

cd "$HOME/GitHub/terminalforlife/Personal/i3Config"

{
	rm -v "$HOME/.config/i3/config"
	ln -v source/config "$HOME/.config/i3/config"

	cd source/.i3a
	for CurFile in *; do
		rm -v "$HOME/.i3a/$CurFile"
		ln -v "$CurFile" "$HOME/.i3a/$CurFile"
	done
} 2> /dev/null
