#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./bar-functions and use: . "$DIR/bar-functions/dwm_example.sh"

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1="["
export SEP2="]"

# Import the modules
. "$DIR/dwm_transmission.sh"
. "$DIR/dwm_cmus.sh"
. "$DIR/dwm_resources.sh"
. "$DIR/dwm_battery.sh"
. "$DIR/dwm_mail.sh"
. "$DIR/dwm_backlight.sh"
. "$DIR/dwm_pulse.sh"
. "$DIR/dwm_network.sh"
. "$DIR/dwm_date.sh"

# Update dwm status bar every second
while true
do
    xsetroot -name "$(dwm_transmission)$(dwm_pulse)$(dwm_date)"
    #xsetroot -name "$(dwm_transmission)$(dwm_cmus)$(dwm_resources)$(dwm_battery)$(dwm_mail)$(dwm_backlight)$(dwm_pulse)$(dwm_network)$(dwm_date)"
    sleep 1
done
