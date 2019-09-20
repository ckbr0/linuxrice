#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

#PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

alias sudo='sudo '

alias e='$EDITOR'
alias v='$EDITOR'

[ -f $HOME/.local/bin/quitcd.bash ] && source $HOME/.local/bin/quitcd.bash
[ -f $HOME/.local/nnn-completion.bash ] && source $HOME/.local/bin/nnn-completion.bash
alias n='nnn'

alias ls='ls -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

. "${HOME}/.cache/wal/colors.sh"

command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell bash)"
