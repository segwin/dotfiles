#!/bin/bash

weather_feed=$(curl -s https://weather.gc.ca/rss/city/qc-147_e.xml | sed '2 s/xmlns=".*"//g')
weather_cur=$(echo "$weather_feed" | xmllint --xpath "//entry/category[@term='Current Conditions']/../summary/text()" -)
weather_render=$(echo "$weather_cur" | sed 's/<!\[CDATA\[\|\]\]>\|<br\/>\|<b>\|<\/b>\| *$//g'| sed 's/&deg;/°/g')
weather_trim=$(echo "$weather_render" | sed 's/ *$//g'| sed 's/: /:/g')

echo "$weather_trim" | awk -F: '$1=="Temperature"{t=$2};$1=="Condition"{c=$2};END{print c" ("t")"}'
