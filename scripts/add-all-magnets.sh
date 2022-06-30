#!/bin/bash

# This takes a file with magnet links and adds them to a local Transmission server.
# After adding the magnet links to Transmission, it adds them  to an archive file for storage.

# Dependencies: transmission-cli (e.g., sudo apt install transmission-cli)

FILE=magnets.txt # The file with a magnet link on each line

# Sets download directory for all magnet links in magnets.txt
# Use an absolute path, dont worry about spaces or weird chars
DL_DIR='/dir/whatever: idk/something 123/'   

# I could prompt for input here and assign that to $DL_DIR, but I dont want the user to make a mistake
# and accidentally add files to the wrong directory since they'd have to manually fix everything. 
read -p "Set download dir in script variables. Press CTRL+C to exit or press enter to continue. "

# Loop through magnets.txt and add each line as magnet link to Transmission
while read LINE
do
#	transmission-remote -w \'$DL_DIR\' -a \'$LINE\' 
	echo transmission-remote -a \'$LINE\' -w \'$DL_DIR\' | bash
# Excuse this atrocity. For some reason, the commented command above wouldn't work when the download directory
# had spaces or any weird chars in it. But when I manually typed in the exact same command with the exact 
# same args, it would work just fine. Something to do with text parsing is my guess, but I thought 
# everything in bash is a string? I dont know. This is a stupid and digusting fix but it works. 
	echo $LINE >> archive-magnets.txt # Add each line to archive file
done < $FILE
> $FILE # Clear out magnets file when finished
