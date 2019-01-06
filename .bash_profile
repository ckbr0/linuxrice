#!/bin/bash

export PATH="$PATH:$HOME/.scripts"
export EDITOR="vis"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

export NNN_USE_EDITOR=1
export DISABLE_FILE_OPEN_ON_NAV=1

[ -f ~/.bashrc ] && source ~/.bashrc

if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
	pgrep -x dmw || exec startx
fi

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
