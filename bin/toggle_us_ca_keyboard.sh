#!/bin/bash

if [ "$(setxkbmap -query | awk '/layout/ {print $2}')" == "us" ]; then
    setxkbmap -layout ca
elif [ "$(setxkbmap -query | awk '/layout/ {print $2}')" == "ca" ]; then
    setxkbmap -layout us
else
    setxkbmap -layout us
fi

