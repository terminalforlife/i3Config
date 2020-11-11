#!/bin/sh

#------------------------------------------------------------------------------
# Project Name      - i3Config/devutils/links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Wed 11 Nov 16:42:25 GMT 2020
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#
# Dependencies:
#
#   coreutils (>= 8.25-2)
#------------------------------------------------------------------------------

cd "$HOME/GitHub/terminalforlife/Personal/i3Config"

{
	rm -v "$HOME/.config/i3/config"
	ln -v source/config "$HOME/.config/i3/config"

	[ -d "$HOME/.i3a" ] || mkdir "$HOME/.i3a"

	if cd source/.i3a; then
		for CurFile in *; do
			rm -v "$HOME/.i3a/$CurFile"
			ln -v "$CurFile" "$HOME/.i3a/$CurFile"
		done
	fi
} 2> /dev/null
