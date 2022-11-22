# set gpu
prime-offload
optimus-manager-qt &

# set resolution and wallpaper
xrandr --output Screen 0 --mode 1920x1080 --rate 60.00
feh --randomize --bg-fill /home/baitwo02/Pictures/wallpapers/archlinux/*

# transparency
picom -b

# input method
fcitx5 &

# network
nm-applet &
cfw &

# screen shotcut
flameshot &

st &
