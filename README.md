**MASTER** - _Hopefully stable branch._\
**DEV** - _Development Branch (latest changes)_

An Ubuntu base greater than or equal to version 16.04 is recommended.

Some DEB packages I use or are needed with this i3-wm setup:

_libanyevent-i3-perl_\
_libnotify-bin_\
_libnotify4_\
_libtfl-perl_ ([get](https://github.com/terminalforlife/DEB-Packages))

_compton_\
_dunst_\
_feh_\
_firefox_\
_i3-wm_\
_i3lock_\
_imagemagick_\
_keynav_\
_moc_\
_mplay_ ([get](https://github.com/terminalforlife/DEB-Packages))\
_procps_\
_pulseaudio_\
_pulseaudio-utils_\
_redshift_\
_redshifter_ ([get](https://github.com/terminalforlife/DEB-Packages))\
_scrot_\
_skypeforlinux_ ([get](https://www.skype.com/en/get-skype))\
_sound-theme-freedesktop_\
_suckless-tools_\
_x11-utils_\
_x11-xkb-utils_\
_x11-xserver-utils_\
_xfce4-terminal_\
_yad_

To install these packages, run the following one-liner in a terminal:

```bash
wget -q 'https://raw.githubusercontent.com/terminalforlife/i3Config/master/get_packages' -O - | sudo bash -
```

If you don't have `sudo` available, just omit it from the above line.

The above was last updated on: 2019-05-11
