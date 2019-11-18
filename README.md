**MASTER** - _Hopefully stable branch._\
**DEV** - _Development Branch (latest changes)_

Installation instructions below were written with **Linux** in mind.

Aside from the packages below, the list of which I cannot guarantee is up-to-date, there are a number of steps you'll need to talk before installing my i3-wm and associated files. Open a terminal or start a new session, then enter the following commands to first back up any files these steps would have you overwrite.

```bash
\printf -v Archive '%s/.B4-I3C_%(%F_%X)T.tgz' "$HOME" -1
\tar -C "$HOME" -czpf "$Archive" .config/i3/config .i3a
```

Now that your files are (hopefully) backed up, you can begin installing the ones from this repository. I'll assume you've already downloaded this repository and have access to the files. So, change directory (`cd`) into the directory in which these files are present, then run the following, which will also **restart i3-wm**:

```bash
\cp -rt "$HOME" .config/i3/config .i3a && \i3-msg restart
```

An Ubuntu base greater than or equal to version 16.04 is recommended. Some DEB packages I use or are needed with this i3-wm setup, are as follows:

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
_sound-theme-freedesktop_\
_suckless-tools_\
_x11-utils_\
_x11-xkb-utils_\
_x11-xserver-utils_\
_xfce4-terminal_

To install these packages, run the following one-liner in a terminal:

```bash
wget -q 'https://raw.githubusercontent.com/terminalforlife/i3Config/master/get_packages' -O - | sudo bash -
```

If you don't have `wget`, but you have `curl`, try this:

```bash
curl -s 'https://raw.githubusercontent.com/terminalforlife/i3Config/master/get_packages' -O - | sudo bash -
```

If you don't have `sudo` available, just omit it from the above line, but ensure you otherwise have root privileges..
