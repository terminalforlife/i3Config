#!/usr/bin/python3.5

#----------------------------------------------------------------------------------
# Project Name      - i3config/yai3bar.py
# Started On        - Sun 19 Nov 23:46:52 GMT 2017
# Last Change       - Mon 20 Nov 01:24:10 GMT 2017
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# As you might have guessed, this is a work in very, very gradual progress. Very
# early days yet; just winging it at the moment, but ideas are forming.
#
# My desire for this is to just be written in Python (not relying on the slower, -
# shell) and for it to have a much, much faster refresh rate than the likes of
# i3blocks. I love i3blocks and used it for ages, but it has the odd drawback.
#
# It'll be a semi-personalized Python program to tack onto i3bar. No messy json!
# I'd also like it to be more involved, with notifications using notify2 based on
# events relative to the data processed here.
#----------------------------------------------------------------------------------

from systemd import login
import time
import os
import sys

def reSize(int(byteNum)):
	if byteNum >=

def sdaSize():
	sizeFile = "/sys/block/sda/size"
	with open(sizeFile, "r") as buffer:
		data = buffer.read()
		data


while True:
	dateTime = (time.strftime("%F %X"))

	print(
		" | ",
		"USERS: ", str(len(login.uids())).zfill(2),
		" | ",
		"KERN: ", os.uname()[2],
		" | ",
		"WHEN:", dateTime,
	)

	time.sleep(0.05)
