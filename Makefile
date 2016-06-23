CONFIG_FILES = vimrc vim tmux.conf gitignore zshrc zpreztorc ctags tmux zsh \
							 zshaliases zshutils
DOTFILE_DIRECTORY = ${HOME}/dotfiles

build:
	@$(foreach	file, ${CONFIG_FILES},                                 \
							rm -rf ${HOME}/.${file};                               \
							ln -sfv ${DOTFILE_DIRECTORY}/${file} ${HOME}/.${file}; \
		)
