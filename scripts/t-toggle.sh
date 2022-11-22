result=$(ps ax | grep -v grep | grep trayer)
if ["$result" ==  ""];then
    eval "trayer --transparent true --expand true --edge bottom --align right --widthtype percent --width 30 --SetDockType true --SetPartialStrut true --tint 0x88888888 --monitor primary"
else
    eval "killall trayer"
fi

