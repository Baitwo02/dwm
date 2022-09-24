#!/bin/bash
result=$(ps ax | grep -v grep | grep trayer)
if ["$result" ==  ""];then
    eval "trayer --transparent true --expand false --edge bottom --align right --width 40 --SetDockType false --tint 0x88888888 "
else
    eval "killall trayer"
fi

