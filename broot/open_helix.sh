#!/bin/bash

if test -z "$1"
then
	echo "File name not provided"
	exit 1
fi

fileName=$(readlink -f $1)
# fileName = "test.json"

zellij action move-focus left 
sleep 0.5
zellij action write-chars ":open $fileName"
zellij action write 13
zellij action move-focus right
zellij action close-pane
