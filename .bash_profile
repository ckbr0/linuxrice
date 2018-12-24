#!/bin/sh

export PATH="$PATH:$HOME/.scripts"
export EDITOR="vis"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

[ -f ~/.bashrc ] && source ~/.bashrc

if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
	pgrep -x dmw || exec startx
fi

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
