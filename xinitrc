#!/bin/sh

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

### GLOBAL Settings ###
# Calibrate screen
xcalib /media/mac/Library/ColorSync/Profiles/Displays/Color\ LCD-42717C0.icc
# Keybindings
xmodmap ~/.xmodmaprc
# Screensaver
xscreensaver -nosplash &
# Trackpad settings
synclient CoastingSpeed=15



### DWM ###
# For silly Java which can't deal with some window managers
wmname LG3D &
_JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_AWT_WM_NONREPARENTING
(conky | while read -r; do xsetroot -name "$REPLY"; done) &
#trayer --SetDockType true --distance 5 --padding 10 --transparent true --alpha 240 --edge bottom --align right --expand false --widthtype request --heighttype pixel --height 10&
#/usr/lib/notification-daemon-1.0/notification-daemon
exec ck-launch-session dwm

