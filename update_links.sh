#!/bin/bash

#----------------------------------------------------------------------------------
# Project Name      - i3config/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Mon 23 Oct 00:40:42 BST 2017
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
	/bin/rm "$HOME/$FILE" && /bin/ln "$FILE" "$HOME/$FILE" || {
		XERR "$LINENO" "Unable to delete file(s) -- will not link."
	}
}

CFILE="$HOME/.config/i3/config"
/bin/rm "$CFILE" && /bin/ln config "$CFILE" || {
	XERR "$LINENO" "Unable to delete file(s) -- will not link."
}
