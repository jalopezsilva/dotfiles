STOW_DIRECTORIES = vim tmux zsh other

install:
	@$(foreach 	directory, ${STOW_DIRECTORIES}, stow ${directory};)

uninstall:
	@$(foreach 	directory, ${STOW_DIRECTORIES}, stow --delete ${directory};)

