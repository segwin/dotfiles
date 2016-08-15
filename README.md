# My dot files
![alt text ](https://raw.githubusercontent.com/lpracette/linux_config/master/screenshot.png "Screenshot of my i3 setup")

## setup

*Ubuntu 16.04.1 LTS (Xenial Xerus) Server minimal install*


with the following packages:

    i3 lxterminal rxvt-unicode-256color lightdm
    x11-xserver-utils
    rofi compton conky
    fonts-inconsolata fonts-powerline fonts-font-awesome

## other software

### packages

    usbmount vpnc firefox remmina cryptsetup uzbl

### Arc GTK Theme

    wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
    sudo apt-key add - < Release.key
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
    sudo apt-get update && sudo apt-get install arc-theme lxappearance

Then choose Arc-Darker in lxappearance.
From http://www.omgubuntu.co.uk/2016/06/install-latest-arc-gtk-theme-ubuntu-16-04

### powerline font

     cd /usr/share/fonts/truetype/
     sudo wget https://github.com/powerline/fonts/blob/master/Inconsolata/Inconsolata%20for%20Powerline.otf?raw=1
     mv Inconsolata\ for\ Powerline.otf\?raw=1 Inconsolata\ for\ Powerline.otf
     fc-cache -f .

### chrome

     wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
     sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
     sudo apt-get install google-chrome-stable

### atom

    wget https://github.com/atom/atom/releases/download/v1.9.8/atom-amd64.deb
    sudo dpkg --install atom-amd64.deb
    sudo apt-get -f install

## credits
### .conky
https://github.com/ThatJames/Conky

### conky for i3Bar
http://pastebin.com/h1g6FTD6


### 3wm: How To
https://www.youtube.com/playlist?list=PL5ze0DjYv5DbCv9vNEzFmP6sU7ZmkGzcf


### Todo
workspace Incons
screen selection
