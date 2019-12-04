#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - i3Config/get_packages.sh
# Started On        - Sat 11 May 14:57:13 BST 2019
# Last Change       - Wed  4 Dec 22:31:01 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Written for Bourne, and to be POSIX-ly correct.
#----------------------------------------------------------------------------------

DepCount=0
for CurDep in mktemp id dpkg apt-get wget rm; do
	if ! command -v "$CurDep" 1> /dev/null 2>&1; then
		printf "ERROR: Dependency '$CurDep' not met.\n" 1>&2
		DepCount=$((DepCount + 1))
	fi
done

[ $DepCount -eq 0 ] || exit 1

if ! [ `id -u` -eq 0 ]; then
	printf "ERROR: Root access required for system-wide changes." 1>&2
	exit 1
fi

Packages='
	compton dunst feh fonts-oxygen i3-wm i3lock imagemagick perl x11-apps
	keynav libanyevent-i3-perl libnotify-bin libnotify4 moc mplay procps
	pulseaudio-utils pulseaudio redshift scrot sound-theme-freedesktop
	suckless-tools x11-utils x11-xkb-utils x11-xserver-utils xfce4-terminal
'

AptOpts='-q -o Dpkg::Progress=true -o Dpkg::Progress-Fancy=true -o '
AptOpts="$AptOpts APT::Get::AutomaticRemove=true -o APT::Get::Purge=true"
apt-get $AptOpts install $Packages

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

TempDir=`mktemp -d`

SigHandler(){
	rm -rf "$TempDir"
	exit 0
}

trap SigHandler INT EXIT

for CurDeb in $ExtraPkgs; do
	wget -qO "$TempDir/$CurDeb" "$GitHubURL/$CurDeb"
	dpkg -i "$TempDir/$CurDeb"
done
