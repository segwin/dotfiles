#!/bin/bash
if ping -c1 -W1 $1 >/dev/null 2>&1; then
    printf ' %5s \n' $(ping -c1 -W1 $1 | awk -F'=' '/time/{print $4}'|cut -f 1 -d ' ')
fi
