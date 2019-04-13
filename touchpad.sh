#!/bin/bash

#id=14
id=`xinput --list --short | grep TouchPad | sed -E 's/.*id=(\w+)\s.*/\1/'`
#state=`xinput list-props $1 | grep Enabled | tail -c 2`
state=`xinput list-props $id | grep Enabled | tail -c 2`

if test $state = '1'
then
    xinput disable $id
else
    xinput enable $id
fi
