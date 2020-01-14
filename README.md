**MASTER** - _Hopefully stable branch._\
**DEV** - _Development Branch (latest changes)_

# Introduction to i3Config

My dedicated i3-wm setup, which I've used and tweaked for a few years now, is part of the pride and joy of any of my Linux installations. There will some things you'll want to manually change to fit _your_ needs, if you use this setup.

What you'll get out of this setup is a very clean, minimalistic layout, without the hand-holding of the default i3-wm configuration. You are assumed to be familiar with this tiling window manager. The following is brief list of some features I'd like to highlight:

  * Not just a `config` -- you also get various Shell and Perl plugins.

  * Border-less, indicator-less design, with only subtle transparency hints.

  * No bars invading screen real estate and distracting you from your work.

  * No more inconvenient toggling of modes to manage your windows.

  * Your windows are floating by default, unless configured otherwise.

# Dependencies (2020-01-14)

A lot of the following dependencies can be omitted if you make changes to files in `~/.i3a`.

  * bash (>= 4.3-14)
  * coreutils (>= 8.25-2)
  * feh (>= 2.14-1)
  * i3-wm (>= 4.11-1)
  * i3lock (>= 2.7-1)
  * imagemagick (>= 8:6.8.9.9-7)
  * libanyevent-i3-perl (>= 0.16-1)
  * libnotify-bin (>= 0.7.6-2svn1)
  * libtfl-perl (>= 2020-01-11)
  * moc (>= 1:2.6.0~svn-r2788-1)
  * mplayer (>= 2:1.2.1-1)
  * perl (>= 5.22.1-9)
  * pulseaudio-utils (>= 1:8.0-0)
  * scrot (>= 0.8-17)
  * sed (>= 4.2.2-7)
  * suckless-tools (>= 42-1)
  * x11-apps (>= 7.7+5+nmu1)
  * x11-xserver-utils (>= 7.7+7)
  * xfce4-terminal (>= 0.6.3-2)

Notice something missing or unneeded? Let me know!

# Recommended Packages (2020-01-14)

The following packages are not required, but recommended, for a fuller experience more akin to my own.

  * compton (>= 0.1~beta2-1)
  * dunst (>= 1.1.0-2)
  * mplay (>= 2019-05-09)
  * redshift (>= 1.10-5)
  * redshifter (>= 2019-12-31)
  * udisks2 (>= 2.1.7-1)

# Have Some Questions?

You might have some questions, so here, I'll attempt a pre-emptive strike:

  **Q: Why float by default?**\
  A: New, non-configured windows are useable, instead of a huge mess.

  **Q: What's wrong with modes?**\
  A: To be frank, I consider them to be inefficient and annoying.

  **Q: Why are you using 'jkl;' keys instead of vim-like keys?**\
  A: Because I type _properly_ and don't want to butcher the keyboard.

  **Q: Why no bars?**\
  A: As said above, they're distracting and take up screen space.

  **Q: Will you bring them back?**\
  A: Maybe some day, but I doubt it. You can still add your own, though.

  **Q: How can I contribute?**\
  A: Pull requests are welcome, but failing that, sharing is caring!

  **Q: I have this horrible bug -- what can I do?**\
  A: Post an issue report on GitHub, or E-Mail: terminalforlife@yahoo.com

  **Q: How portable is this setup?**\
  A: You may have some issues here, but I'll address this when possible.

  **Q: I wrote a cool plugin, can I add it to your repository?**\
  A: Possibly...

  **Q: How do you manage without borders and indicators?**\
  A: Besides long-term experience with i3-wm, transparency hints help.

  **Q: Why don't you use Airblader's i3-gaps?**\
  A: Because it's not available in Ubuntu 16.04's repositories.

  **Q: Why not just compile it, then?**\
  A: Because I don't trust the process and feel like it'd make a mess.

  **Q: Why not just use Arch Linux?**\
  A: Because of many reasons I tend to rant about on my [YouTube](https://www.youtube.com/channel/UCfp-lNJy4QkIGnaEE6NtDSg) channel.

  **Q: Have you tried other tiling window managers?**\
  A: Yes, but always came back to i3-wm; it just appeals to me the most.
