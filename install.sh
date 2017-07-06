#!/bin/bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"



DOTFILES_TO_INSTALL="bin .subversion .gitconfig .tmux.conf.local .vimrc .zshrc .bashrc .config/ranger/rc.conf .config/ranger/scope.sh dircolors.256dark .pythonrc"

DOTFILES_TO_INSTALL_i3=" .config/i3/config .config/i3/conky.conf .config/i3/conky-wrapper .config/lxterminal/lxterminal.conf .conky .conkyrc .w3m/config .Xresources"


mkdir -p $HOME/.config/ranger


function confirm()
{
    read -p "$1 [y/N]" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}

for f in $DOTFILES_TO_INSTALL; do
    if [ -h $HOME/$f ]; then
        if [ $(readlink $HOME/$f) = $DOTFILES/$f ]; then
            echo $f already installed
        fi
    else
        if [ -f $HOME/$f ]; then
            if confirm "Overwrite $HOME/$f?"; then
                rm -rf $HOME/$f
                ln -s $DOTFILES/$f $HOME/$f
                echo $HOME/$f installed!
            fi
        else
            ln -s $DOTFILES/$f $HOME/$f
            echo $HOME/$f installed!
        fi
    fi
done

# install oh-my-zsh
if [ -z "$STATE" ]; then
    if [ ! -d $DOTFILES/oh-my-zsh ]; then 
        export ZSH="$DOTFILES/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
fi

# install on-my-tmmux
ln -sf $DOTFILES/.tmux/.tmux.conf
# cd $HOME
# if confirm "Use oh-my-tmux"; then
#     cp $DOTFILES/.tmux/.tmux.conf.local $
# fi

if confirm "Install i3 dotfiles"; then
    for f in $DOTFILES_TO_INSTALL_i3; do
        if [ -h $HOME/$f ]; then
            if [ $(readlink $HOME/$f) = $DOTFILES/$f ]; then
                echo $f already installed
            fi
        else
            if [ -f $HOME/$f ]; then
                if confirm "Overwrite $HOME/$f?"; then
                    rm -rf $HOME/$f
                    ln -s $DOTFILES/$f $HOME/$f
                    echo $HOME/$f installed!
                fi
            else
                ln -s $DOTFILES/$f $HOME/$f
                echo $HOME/$f installed!
            fi
        fi
    done
fi

