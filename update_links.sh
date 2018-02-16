#!/bin/bash

#----------------------------------------------------------------------------------
# Project Name      - i3config/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Fri 16 Feb 20:00:46 GMT 2018
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#------------------------------------------------------------------------------MAIN

XERR(){ printf "[L%0.4d] ERROR: %s\n" "$1" "$2" 1>&2; exit 1; }
ERR(){ printf "[L%0.4d] ERROR: %s\n" "$1" "$2" 1>&2; }

declare -i DEPCOUNT=0
for DEP in /bin/{ln,rm}; {
	[ -x "$DEP" ] || {
		ERR "$LINENO" "Dependency '$DEP' not met."
		DEPCOUNT+=1
	}
}

[ $DEPCOUNT -eq 0 ] || exit 1

[ "${PWD//*\/}" == "i3config" ] || {
	XERR "$LINENO" "Not in the repository's root directory."
}

for FILE in .i3a/* ; {
	/bin/rm -v "$HOME/$FILE" 2> /dev/null
	/bin/ln -v "$FILE" "$HOME/$FILE" 2> /dev/null
}

for FILE in .flout/* ; {
	/bin/rm -v "$HOME/$FILE" 2> /dev/null
	/bin/ln -v "$FILE" "$HOME/$FILE" 2> /dev/null
}

CFILE="$HOME/.config/i3/config"
/bin/rm -v "$CFILE" 2> /dev/null
/bin/ln -v config "$CFILE" 2> /dev/null

CFILE="$HOME/.i3bbelow"
/bin/rm -v "$CFILE" 2> /dev/null
/bin/ln -v .i3bbelow "$CFILE" 2> /dev/null

CFILE="$HOME/.i3babove"
/bin/rm -v "$CFILE" 2> /dev/null
/bin/ln -v .i3babove "$CFILE" 2> /dev/null

CFILE="$HOME/.libi3bview"
/bin/rm -v "$CFILE" 2> /dev/null
/bin/ln -v .libi3bview "$CFILE" 2> /dev/null

# vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup
