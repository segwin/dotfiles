#!/bin/bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"

DOTFILES_TO_INSTALL="bin .subversion .gitconfig .profile .tmux.conf .vimrc .vim/.ycm_extra_conf.py .zshrc .bashrc .shell_alias .shell_env .shell_functions .tmux-onedark-theme .config/ranger/rc.conf .config/ranger/scope.sh .dircolors.256dark .pythonrc .w3m/config"
DOTFILES_TO_INSTALL_i3=" .config/i3/config .config/i3/conky.conf .config/i3/conky-wrapper .config/lxterminal/lxterminal.conf .conky .conkyrc .Xresources"
DOTFILES_TO_INSTALL_TIC=" .tmux.terminfo"

mkdir -p $HOME/.vim
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/ranger
mkdir -p $HOME/.config/lxterminal
mkdir -p $HOME/.w3m

function confirm()
{
    read -p "$1 [y/N]" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}

# Update submodules
TMP=$(cd $DOTFILES && git submodule update --init --recursive)

for f in $DOTFILES_TO_INSTALL; do
    if [ -h $HOME/$f ]; then
        if [ $(readlink $HOME/$f) = $DOTFILES/$f ]; then
            echo $f already installed
        fi
    else
        if [ -f $HOME/$f ]; then
            if confirm "Overwrite $HOME/$f?"; then
                rm -rf $HOME/$f
                ln -sf $DOTFILES/$f $HOME/$f
                echo $HOME/$f installed!
            fi
        else
            ln -sf $DOTFILES/$f $HOME/$f
            echo $HOME/$f installed!
        fi
    fi
done

if confirm "Install tmux terminfo"; then
    for f in $DOTFILES_TO_INSTALL_TIC; do
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

    tic -x $HOME/.tmux.terminfo
fi

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
