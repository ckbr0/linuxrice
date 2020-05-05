#!/bin/bash

export RAZVOJ="$HOME/razvoj"
export GOPATH="$RAZVOJ/go"
export DOTNET_ROOT=$HOME/dotnet
export PATH="$PATH:$HOME/.local/bin:$GOPATH:$DOTNET_ROOT"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export PAGER="less"

export GPG_TTY=$(tty)

export _JAVA_AWT_WM_NONREPARENTING=1

export SUDO_ASKPASS=$HOME/.local/bin/dmenupass

[ -f ~/.bashrc ] && source ~/.bashrc

if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
	pgrep -x dmw || exec startx
fi

source ~/.cache/wal/colors-tty.sh
