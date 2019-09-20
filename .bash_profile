#!/bin/bash

export RAZVOJ="$HOME/razvoj"
export GOPATH="$RAZVOJ/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin:$GOBIN/"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

export NNN_USE_EDITOR=1
export NNN_RESTRICT_NAV_OPEN=1
export NNN_OPS_PROG=1

export _JAVA_AWT_WM_NONREPARENTING=1

[ -f ~/.bashrc ] && source ~/.bashrc

if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
	pgrep -x dmw || exec startx
fi

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
