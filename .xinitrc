#cvt 1080 1920 60
#xrandr --newmode "1080x1920_60.00"  176.50  1080 1168 1280 1480  1920 1923 1933 1989 -hsync +vsync
#xrandr --addmode Virtual1 1080x1920
#xrandr --output Virtual1 --mode 1080x1920
mkfontdir ~/.fonts
xset fp+ ~/.fonts
xset fp rehash
fc-cache -f -v
#xcompmgr -c &
#~/bin/background
