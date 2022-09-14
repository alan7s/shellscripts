#!/bin/bash
#setup abnt portuguese keyboard
setxkbmap -model abnt2 -layout br
if [[ $? == 0 ]]; then
 echo "ok"
else
 echo "fail"
fi
