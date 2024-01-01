#!/bin/bash

_W_=$1
_H_=$2

_MON_=`xrandr --listactivemonitors | grep '0:' | awk '{print $4}'`
echo $_MON_

_MODE_=`cvt $_W_ $_H_ 60 | grep Modeline | awk '{print $3 " " $4 " " $5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " $13}'`
 #| sed 's/Modeline //g'`
echo $_MODE_

_MODENAME_=${_W_}x${_H_}
xrandr --newmode $_MODENAME_ $_MODE_
xrandr --addmode $_MON_ $_MODENAME_
xrandr --output $_MON_ --mode $_MODENAME_
