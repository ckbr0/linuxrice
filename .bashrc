#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s direxpand
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

# Use bash-completion, if available
[[ -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion

[[ -f $HOME/.local/bin/git-prompt.sh ]] && \
    source $HOME/.local/bin/git-prompt.sh

export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true

export HISTCONTROL=ignoredups:erasedups

#export PS1='[\u@\h \W]\$ '
export PS1='\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]$(__git_ps1)\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]'
#export PROMPT_COMMAND='__git_ps1'

#export MANPAGER="sh -c 'less'"

export GPG_TTY=$(tty)

alias sudo='sudo '

alias e='$EDITOR'
alias v='$EDITOR'
alias V='sudoedit'

alias gpg='gpg2'

alias dnet='CLR_OPENSSL_VERSION_OVERRIDE=47 dotnet'

alias py3='python3'

alias ls='ls -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias s='sxiv'
alias z='zathura'
alias scan='scanimage -y 296.926 --format=jpeg'

alias tsm="transmission-remote"

[[ -f $HOME/razvoj/esp/esp-idf/export.sh ]] && \
    alias get_idf='. $HOME/razvoj/esp/esp-idf/export.sh'

export PF_INFO="ascii title os host kernel shell uptime pkgs memory"
pfetch

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


