#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - i3Config/devutils/packages.sh
# Started On        - Sat 11 May 14:57:13 BST 2019
# Last Change       - Fri  6 Dec 15:57:15 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Written for a Bourne, POSIX-compliant shell, and requires `libtflbp-sh`.
#----------------------------------------------------------------------------------

. /usr/lib/tflbp-sh/Err
. /usr/lib/tflbp-sh/ChkDep

ChkDep mktemp id dpkg apt-get wget rm

[ `id -u` -eq 0 ] || Err 1 "Root access required for system-wide changes."

Packages='
	compton dunst feh fonts-oxygen i3-wm i3lock imagemagick perl x11-apps
	keynav libanyevent-i3-perl libnotify-bin libnotify4 moc mplay procps
	pulseaudio-utils pulseaudio redshift scrot sound-theme-freedesktop
	suckless-tools x11-utils x11-xkb-utils x11-xserver-utils xfce4-terminal
'

AptOpts='-q -o Dpkg::Progress=true -o Dpkg::Progress-Fancy=true -o '
AptOpts="$AptOpts APT::Get::AutomaticRemove=true -o APT::Get::Purge=true"
if ! apt-get $AptOpts install $Packages; then
	Err 1 "Packages failed to install with 'apt-get'."
fi

GitHubURL='https://github.com/terminalforlife/DEB-Packages/raw/master'

ExtraPkgs='
	libtfl-perl_2019-05-18_all.deb
	mplay_2019-05-09_all.deb
	roks_2019-11-01_all.deb
	redshifter_2019-05-09_all.deb
	apt-undo-install_2019-05-09_all.deb
	lspkg_2019-05-09_all.deb
	lsbins_2019-05-09_all.deb
	previewer_2019-05-09_all.deb
	rmne_2019-12-04_all.deb
	purgerc_2019-05-09_all.deb
	wcdl_2019-05-11_all.deb
	simplify-ubuntu_2019-05-09_all.deb
	ubuntu-syschk_2019-10-27_all.deb
	backmeup_2019-10-27_all.deb
	shlides_2019-11-22_all.deb
	mplay_2019-05-09_all.deb
'

if ! TempDir=`mktemp -d`; then
	Err 1 'Failed to create temporary directory.'
fi

SigHandler(){
	rm -rf "$TempDir"
	exit 0
}

trap SigHandler INT EXIT

for CurDeb in $ExtraPkgs; do
	if wget -qO "$TempDir/$CurDeb" "$GitHubURL/$CurDeb"; then
		if ! dpkg -i "$TempDir/$CurDeb"; then
			Err 0 "Package '$CurDeb' failed to install."
		fi
	else
		Err 0 "Package '$CurDeb' failed to download with 'wget'."
	fi
done
