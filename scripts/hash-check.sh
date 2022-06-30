#!/bin/bash

# Make sure 2 arguments are input
if [ "$#" -ne 2 ]; then
	echo "Usage: ./hash-check.sh <file_to_hash> <expected_hash>";
	return 1;
fi

# Compare hashes
if [ $(sha256sum $1 | cut -f 1 -d ' ') == $2 ]; then
	echo "Hash match";
else
	echo "Error: hash mismatch";
	return 1;
fi
