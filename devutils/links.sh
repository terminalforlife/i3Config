#!/bin/sh

#------------------------------------------------------------------------------
# Project Name      - i3Config/devutils/links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Fri 11 Mar 20:34:36 GMT 2022
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#
# Dependencies:
#
#   coreutils (>= 8.25-2)
#------------------------------------------------------------------------------

exec 2> /dev/null

if cd "$HOME/GitHub/terminalforlife/Personal/i3Config"; then
	mkdir -pv "$HOME/.i3a"

	ln -vf source/config "$HOME/.config/i3/config"
	ln -vf source/rules "$HOME/.config/i3/rules"

	if cd source/.i3a; then
		for CurFile in *; do
			ln -vf "$CurFile" "$HOME/.i3a/$CurFile"
		done
	fi
fi
