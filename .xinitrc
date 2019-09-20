#!\bin\sh

[ -f ~/.xprofile ] && . ~/.xprofile

# The loop restarts dwm when you quit
while :; do
	ssh-agent dwm || break
done
