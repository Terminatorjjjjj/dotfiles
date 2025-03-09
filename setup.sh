#!/bin/sh
# $1 = <dir to dotfiles>

ln -s $1 ~/.dotfiles

ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/git/gitignore_global/ ~/.gitignore_global
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim/ ~/.vim
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

mkdir -p ~/.config
ln -s ~/.dotfiles/nvim/ ~/.config/nvim

