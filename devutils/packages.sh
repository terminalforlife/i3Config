#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - i3Config/devutils/packages.sh
# Started On        - Sat 11 May 14:57:13 BST 2019
# Last Change       - Tue 10 Dec 15:08:34 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Written for a Bourne, POSIX-compliant shell, and requires `libtflbp-sh`.
#----------------------------------------------------------------------------------

. /usr/lib/tflbp-sh/Err
. /usr/lib/tflbp-sh/ChkDep

ChkDep mktemp id dpkg apt-get rm

[ `id -u` -eq 0 ] || Err 1 "Root access required for system-wide changes."

if ChkDep curl; then
	DLCMD='curl -so'
elif ChkDep wget; then
	DLCMD='wget -qO'
else
	Err 1 "Neither 'wget' nor 'curl' is available."
fi

Packages='
	compton dunst feh fonts-oxygen i3-wm i3lock imagemagick perl x11-apps
	keynav libanyevent-i3-perl libnotify-bin libnotify4 moc procps
	pulseaudio-utils pulseaudio redshift scrot sound-theme-freedesktop
	suckless-tools x11-utils x11-xkb-utils x11-xserver-utils xfce4-terminal
'

AptOpts='-q -o Dpkg::Progress=true -o Dpkg::Progress-Fancy=true -o '
AptOpts="$AptOpts APT::Get::AutomaticRemove=true -o APT::Get::Purge=true"
if ! apt-get $AptOpts install $Packages; then
	Err 1 "One or more packages failed to install with 'apt-get'."
fi

GitHubURL='https://raw.githubusercontent.com/terminalforlife/DEB-Packages/master'

ExtraPkgs='
	apt-undo-install/apt-undo-install_2019-05-09_all.deb
	backmeup/backmeup_2019-10-27_all.deb
	cito/cito_2019-12-10_all.deb
	clean-locales/clean-locales_2019-11-01_all.deb
	cpufreq/cpufreq_2019-05-04_all.deb
	getip/getip_2019-05-09_all.deb
	libtflbp-sh/libtflbp-sh_2019-12-10_all.deb
	libtfl-perl/libtfl-perl_2019-05-18_all.deb
	lsbins/lsbins_2019-05-09_all.deb
	lspkg/lspkg_2019-05-09_all.deb
	mplay/mplay_2019-05-09_all.deb
	previewer/previewer_2019-05-09_all.deb
	purgerc/purgerc_2019-05-09_all.deb
	redshifter/redshifter_2019-05-09_all.deb
	rmne/rmne_2019-12-04_all.deb
	roks/roks_2019-11-01_all.deb
	shlides/shlides_2019-11-22_all.deb
	simplify-ubuntu/simplify-ubuntu_2019-05-09_all.deb
	suptime/suptime_2019-05-09_all.deb
	ubuntu-syschk/ubuntu-syschk_2019-10-27_all.deb
	wcdl/wcdl_2019-05-11_all.deb
'

if ! TempDir=`mktemp -d`; then
	Err 1 'Failed to create temporary directory.'
fi

SigHandler(){
	Sig=$?
	rm -rf "$TempDir"
	exit $Sig
}

trap SigHandler INT EXIT

for CurDeb in $ExtraPkgs; do
	if $DLCMD "$TempDir/${CurDeb##*/}" "$GitHubURL/$CurDeb"; then
		if ! dpkg -i "$TempDir/${CurDeb##*/}"; then
			Err 0 "Package '$CurDeb' failed to install."
		fi
	else
		Err 0 "Package '$CurDeb' failed to download with 'wget'."
	fi
done
