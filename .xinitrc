#!\bin\sh

[ -f ~/.xprofile ] && . ~/.xprofile

ssh-agent dwm || break
