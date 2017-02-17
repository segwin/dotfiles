#!/bin/sh
mkdir -p ~/.wallpaper/captions

#Get information from bing rss feed
imageOfTheDayAtom=$(curl -s "https://www.bing.com/HPImageArchive.aspx?n=1")
imageOfTheDayUrl="https://www.bing.com$(echo $imageOfTheDayAtom | xmllint --xpath 'images/image/urlBase/text()' - )_1920x1080.jpg"
imageOfTheDayCopyright=$(echo $imageOfTheDayAtom  | xmllint --xpath "images/image/copyright/text()" - | sed 's/&#xA9\;/©/')

#Get image
curl -s "$imageOfTheDayUrl" > ~/.wallpaper/image.jpg

#Annotate with copyright
convert .wallpaper/image.jpg -fill white -undercolor '#00000080' -gravity SouthWest -pointsize 18 -annotate +5+5 "$(echo $imageOfTheDayCopyright)" .wallpaper/image.jpg

#set background
feh --bg-fill ~/.wallpaper/image.jpg

