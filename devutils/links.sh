#!/bin/sh

#------------------------------------------------------------------------------
# Project Name      - i3Config/devutils/links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Fri 18 Mar 02:00:51 GMT 2022
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

	for File in config rules binds; do
		ln -vf source/"$File" "$HOME/.config/i3/$File"
	done

	if cd source/.i3a; then
		for CurFile in *; do
			ln -vf "$CurFile" "$HOME/.i3a/$CurFile"
		done
	fi
fi
