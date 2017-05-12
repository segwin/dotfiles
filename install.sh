#!/bin/bash
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"

DOTFILES_TO_INSTALL="bin .subversion .gitconfig .tmux.conf .vimrc .zshrc .bashrc .config/ranger/rc.conf .config/ranger/scope.sh dircolors.256dark"


function confirm()
{
    read -p "$1 " -n 1 -r
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

