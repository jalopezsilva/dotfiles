#!/bin/bash
dotfiles_directory=~/dotfiles
files="vimrc gvimrc vim tmux.conf gitignore zshrc zpreztorc ctags"

cd $dotfiles_directory

for file in $files; do
  rm -rfv ~/.$file
  ln -sfv $dotfiles_directory/$file ~/.$file
done
