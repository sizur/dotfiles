#!/usr/bin/bash
VBoxClient-all
pulseaudio --start

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

xrandr -s 0

xset fp+ ~/.local/share/fonts
xset fp rehash
fc-cache -f -v

xrdb -load $HOME/.Xdefaults

xset s off

$HOME/bin/wallpaper
xcompmgr -c &
xsetroot -cursor_name left_ptr
setxkbmap -layout us,ru -variant ,phonetic -option grp:menu_toggle

exec xmonad > $HOME/.xmonad/log.txt 2>&1

#startlxde

# grp:toggle           Right Alt
# grp:lalt_toggle      Left Alt
# grp:caps_toggle      Caps Lock
# grp:shift_caps_toggle Shift+Caps Lock
# grp:alt_caps_toggle  Alt+Caps Lock
# grp:shifts_toggle    Both Shift keys together
# grp:alts_toggle      Both Alt keys together
# grp:ctrls_toggle     Both Ctrl keys together
# grp:ctrl_shift_toggle Ctrl+Shift
# grp:lctrl_lshift_toggle Left Ctrl+Left Shift
# grp:rctrl_rshift_toggle Right Ctrl+Right Shift
# grp:ctrl_alt_toggle  Alt+Ctrl
# grp:alt_shift_toggle Alt+Shift
# grp:lalt_lshift_toggle Left Alt+Left Shift
# grp:alt_space_toggle Alt+Space
# grp:menu_toggle      Menu
# grp:lwin_toggle      Left Win
# grp:win_space_toggle Win Key+Space
# grp:rwin_toggle      Right Win
# grp:lshift_toggle    Left Shift
# grp:rshift_toggle    Right Shift
# grp:lctrl_toggle     Left Ctrl
# grp:rctrl_toggle     Right Ctrl
# grp:sclk_toggle      Scroll Lock
