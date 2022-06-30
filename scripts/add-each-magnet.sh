#!/bin/bash

# This takes a file with magnet links and adds them to a local Transmission server.
# After adding the magnet links to Transmission, it adds them  to an archive file for storage.

# Dependencies: transmission-cli (e.g., sudo apt install transmission-cli)

FILE=magnets.txt # The file with a magnet link on each line

read -p "Check $FILE for list of magnets. Press CTRL+C to exit or enter to continue. "

# Loop through magnets.txt and add each line as magnet link to Transmission
i=0
while read LINE
do
#	transmission-remote -w \'$DL_DIR\' -a \'$LINE\' 
    i=$((++i))
    read -p "Download directory for magnet on line $i: " DL_DIR
	echo transmission-remote -a \'$LINE\' -w \'$DL_DIR\' | bash
# Excuse this atrocity. For some reason, the commented command above wouldn't work when the download directory
# had spaces or any weird chars in it. But when I manually typed in the exact same command with the exact 
# same args, it would work just fine. Something to do with text parsing is my guess, but I thought 
# everything in bash is a string? I dont know. This is a stupid and digusting fix but it works. 
	echo $LINE >> archive-magnets.txt # Add each line to archive file
done < $FILE
> $FILE # Clear out magnets file when finished
