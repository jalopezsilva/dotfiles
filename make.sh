# !bin/bash
dotfiles_directory=~/dotfiles
files="vimrc gvimrc vim tmux.conf"

cd $dotfiles_directory

for file in $files; do
	ln -sf $dotfiles_directory/$file ~/.$file
done
