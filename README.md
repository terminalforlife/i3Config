# i3config
My configuration file(s) and scripts for the i3-wm.

**MASTER** - _Hopefully stable branch._\
**DEV** - _Development Branch (latest changes)_

## WHAT IS IT?

If you're an i3-wm (i3 Window Manager) user like me, you'll probably be interested in checking out other people's configuration files, or maybe even trying their setups like a theme. Well, you're more than welcome to do so with mine, that's why it's on GitHub! That, and it's easier for me to manage.

## WHAT'S ON OFFER?

* Tidy, carefully-written configuration files.
* Partmount; this allows you to easily toggle-mount filesystems via keyboard shortcuts.
* Scripts which allow additional features and help keep the i3 "config" file nice and tidy.
* For as long as I use i3-wm (I dunno how I could survive without it!), these will surely be updated and maintained.
* The flag --no-startup-id is attached to all instanced of "exec", to avoid the endless busy cursor.
* Absolutely no bars, as I consider them unnecessary; this gives you the entire screen to utilize.
* Support for various XF86 keys, as I use quite a few of those with various keyboards.
* Support for taking full screenshots as well as "Selectshots", which make use of scrot with the -s flag.
* Support for floating webcam window at the touch of a button(s) which allows for easier screencasting.
* No indicator! My setup assumes you can i3-wm well, without the need for things like the indicator, borders, and title bars.
* Standard i3-wm (touch-type) mapping scheme. I remap VIM to match i3-wm per traditional touch-typing.
* No need to mess around with modes; cool as they are, they're inefficient. You can resize windows on-the-fly.
* Various keyboard shortcuts to support my music editor of choice, moc (Music on Console).
* Sink and source volume mute toggle and raise/lower support, using pactrl. Note: You'll have to specify your own devices!
* Easy support for various event sound effects. I've not yet got mine up on GitHub. See below.
* A nice wallpaper slideshow using feh. See program "dlspwalls" in miscellaneous repository.
* Simple feature to enable and disable keyboard autorepeat at the press of a button.

...and probably other things I'm missing.

## REQUIREMENTS

To get the most out of this setup, or to even have it working at all like it does for me, you'll need the following Ubuntu and/or Debian based packages, and their dependencies:

```
i3-wm - improved dynamic tiling window manager
moc - ncurses based console audio player
pulseaudio-utils - Command line tools for the PulseAudio sound server
scrot - command line screen capture utility
suckless-tools - simple commands for minimalistic window managers
xfce4-terminal - Xfce terminal emulator
libnotify4 - sends desktop notifications to a notification daemon
feh - imlib2 based image viewer
xorg - X.Org X Window System
```

## INSTALLATION

Visit the installit repository to use the easy-to-use TFL downloader.

## USING COMPTON

Although compton isn't required for this setup, I strongly recommend it, as i3-wm is a bit lackluster without it. If you decide to use compton, check out my compton.conf settings and, if you like, copy them over to `$HOME/.config/compton.conf`, but be sure you check it for anything which wouldn't be compatible with your setup or especially hardware.

I use an nVidia GPU and a 64-bit Intel CPU, if that helps at all.

## MAKING CHANGES

If you'd like to make changes to the configuration files, this section might help you, particularly if you're not familiar with i3-wm.

#### Selecting Own PulseAudio Devices

As mentioned above my i3-wm setup has a few event sounds. I used to have a lot, but they honestly got annoying after a while. I've since found a happy medium between sounds and silence, using discreet sounds when it's most useful to have audible feedback, mostly to ensure I actually pressed the key properly!

If you see "paplay" (might help to search for it with your text editor), then there's a good chance it's pointing to either a variable assigned to a filename, or the filename itself. This is what you want to change. Using paplay does however limit you to certain file types; for example, paplay will not play mp3 files, or at least it doesn't for me. Your best bet is to use ogg or wav, or look online to see which file formats it supports out of the box.

## ...to be continued!
