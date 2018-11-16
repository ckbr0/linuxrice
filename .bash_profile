#!/bin/sh

export PATH="$PATH:$HOME/.scripts"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"

[ -f ~/.bashrc ] && source ~/.bashrc

if [ "$(tty)" == "/dev/tty1" ]; then
	pgrep -x dmw || exec startx
fi

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
