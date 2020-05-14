#!/bin/sh
# Quick and dirty workspace script using tamwm's layout switcher

active_dtop=$(wmctrl -d|grep "*"|awk '{print $10}')
color0="250F0B"
color2="F2D06D"
color3="832426"
active_left="%{F#$color0}%{+u}%{u#$color3} "
active_right=" %{-u}%{F-}"
inactive_left="%{F#$color0}%{+u}%{u#$color2} "
inactive_right=" %{-u}%{F-}"

dtops=$(wmctrl -d|awk -vORS="" -vOFS="" -v active_dtop="$active_dtop" -v active_left="$active_left" -v active_right="$active_right" -v inactive_left="$inactive_left" -v inactive_right="$inactive_right" '
  {
     if ($10==active_dtop) {
       item=active_left $10 active_right
    }else {
       item=inactive_left $10 inactive_right
    }
    if (i == "") {
      print "%{A1:tamwm -d dnum "$1":}"item"%{A}"
      i = 1
    }
    else {
      print " %{A1:tamwm -d dnum "$1":}"item"%{A}"
    }
  }')

echo $dtops