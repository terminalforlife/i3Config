**MASTER** - _Hopefully stable branch._\
**DEV** - _Development Branch (latest changes)_

### REQUIREMENTS (2019-05-11)

An Ubuntu base greater than or equal to version 16.04 is recommended.

Some DEB packages I use or are needed with this i3-wm setup:

libanyevent-i3-perl\
libnotify-bin\
libnotify4\
libtfl-perl ([get](https://github.com/terminalforlife/DEB-Packages))

compton\
dunst\
feh\
firefox\
i3-wm\
i3lock\
imagemagick\
keynav\
moc\
mplay ([get](https://github.com/terminalforlife/DEB-Packages))\
procps\
pulseaudio\
pulseaudio-utils\
redshift\
redshifter ([get](https://github.com/terminalforlife/DEB-Packages))\
scrot\
skypeforlinux ([get](https://www.skype.com/en/get-skype))\
sound-theme-freedesktop\
suckless-tools\
x11-utils\
x11-xkb-utils\
x11-xserver-utils\
xfce4-terminal \
yad

To install these packages, run the following one-liner in a terminal:

```bash
/usr/bin/wget -q 'https://raw.githubusercontent.com/terminalforlife/i3Config/master/get_packages' -O - | sudo /bin/bash -
```

If you don't have `sudo` available, just omit it from the above line.
