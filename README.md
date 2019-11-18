**MASTER** - _Hopefully stable branch._\
**DEV** - _Development Branch (latest changes)_

Installation instructions below were written with **Linux** in mind.

Aside from the packages below, the list of which I cannot guarantee is up-to-date, there are a number of steps you'll need to take before installing my i3-wm and associated files. Open a terminal or start a new session, then enter the following commands to first back up any files these steps would have you overwrite.

```bash
\printf -v Archive '%s/.B4-I3C_%(%F_%X)T.tgz' "$HOME" -1
\tar -C "$HOME" -czpf "$Archive" .config/i3/config .i3a
```

Now that your files are (hopefully) backed up, you can begin installing the ones from this repository. I'll assume you've already downloaded this repository and have access to the files. So, change directory (`cd`) into the directory in which these files are present, then run the following, which will also **restart i3-wm**:

```bash
\cp -rt "$HOME" .config/i3/config .i3a && \i3-msg restart
```

An Ubuntu base greater than or equal to version 16.04 is recommended. Some DEB packages I use or are needed with this i3-wm setup, are as follows:

  * compton - compositor for X11, based on xcompmgr
  * dunst - dmenu-ish notification-daemon
  * feh - imlib2 based image viewer
  * firefox - Safe and easy web browser from Mozilla
  * i3-wm - improved dynamic tiling window manager
  * i3lock - improved screen locker
  * imagemagick - image manipulation programs -- binaries
  * keynav - keyboard-driven mouse cursor mover
  * libanyevent-i3-perl - Perl module to communicate with the i3 window manager
  * libnotify-bin - sends desktop notifications to a notification daemon (Utilities)
  * libnotify4 - sends desktop notifications to a notification daemon
  * [libtfl-perl](https://github.com/terminalforlife/DEB-Packages) - Functionality for TFL Perl programs and general scripts.
  * moc - ncurses based console audio player
  * [mplay](https://github.com/terminalforlife/DEB-Packages) - MOC Wrapper for a clean layout with a subtle transparent theme.
  * procps - /proc file system utilities
  * pulseaudio - PulseAudio sound server
  * pulseaudio-utils - Command line tools for the PulseAudio sound server
  * redshift - Adjusts the color temperature of your screen
  * [redshifter](https://github.com/terminalforlife/DEB-Packages) - View your internal and/or external IP address.
  * scrot - command line screen capture utility
  * sound-theme-freedesktop - freedesktop.org sound theme
  * suckless-tools - simple commands for minimalistic window managers
  * x11-utils - X11 utilities
  * x11-xkb-utils - X11 XKB utilities
  * x11-xserver-utils - X server utilities
  * xfce4-terminal - Xfce terminal emulator

To install these packages, run the following one-liner in a terminal:

```bash
wget -q 'https://raw.githubusercontent.com/terminalforlife/i3Config/master/get_packages' -O - | sudo bash -
```

If you don't have `wget`, but you have `curl`, try this:

```bash
curl -s 'https://raw.githubusercontent.com/terminalforlife/i3Config/master/get_packages' | sudo bash -
```

If you don't have `sudo` available, just omit it from the above line, but ensure you otherwise have root privileges..
