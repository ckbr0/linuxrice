#!\bin\sh

[ -f ~/.xprofile ] && . ~/.xprofile

. ~/.cache/wal/colors.sh

exec dwm -nb "$background" -nf "$foreground" -sbo "white"
