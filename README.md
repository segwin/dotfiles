# My dot files
![alt text ](https://raw.githubusercontent.com/lpracette/linux_config/master/screenshot.png "Screenshot of my i3 setup")

## setup

*Ubuntu 16.04.1 LTS (Xenial Xerus) Server minimal install*


with the following packages:

    i3 rxvt-unicode-256color lightdm
    x11-xserver-utils conky
    fonts-inconsolata fonts-font-awesome

## other software

### packages

    usbmount vpnc firefox remmina cryptsetup$

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

