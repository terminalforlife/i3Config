#!/bin/bash

#----------------------------------------------------------------------------------
# Project Name      - i3config/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Sun  4 Feb 21:07:50 GMT 2018
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
	/bin/rm "$HOME/$FILE" 2> /dev/null
	/bin/ln "$FILE" "$HOME/$FILE" 2> /dev/null
}

for FILE in .flout/* ; {
	/bin/rm "$HOME/$FILE" 2> /dev/null
	/bin/ln "$FILE" "$HOME/$FILE" 2> /dev/null
}

CFILE="$HOME/.config/i3/config"
/bin/rm "$CFILE" 2> /dev/null
/bin/ln config "$CFILE" 2> /dev/null
