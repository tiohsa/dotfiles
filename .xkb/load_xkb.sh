#!/bin/sh

# gnome-session-properties
# Load XKB Map
# ~/.xkb/load_xkb.sh

# xkbの設定を反映させる
if [ -s $HOME/.xkb/keymap/mykbd ]
then
    sleep 1
    xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/mykbd $DISPLAY 2>/dev/null
fi

