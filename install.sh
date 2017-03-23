#!/bin/bash
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"

mkdir -p $HOME/.config/ranger/

for f in bin/ .gitconfig .tmux.conf .vimrc .zshrc .config/ranger/rc.conf .config/ranger/scope.sh; do
    ln -s $DOTFILES/$f $HOME/$f
done
