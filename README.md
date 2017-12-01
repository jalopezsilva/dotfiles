# dotfiles repository

## Installation

The dotfiles installation relies on `stow` and `make`. You should clone the
package on your home directory and change your current directory to it before
installing.

To install:
```
make install
```

To uninstall:
```
make uninstall
```

*Note:* Installation might fail if you have dotfiles that will be replaced by
the installation process. Remove them before installing.

## Dependencies

The vim configuration relies on [Vundle](https://github.com/VundleVim/Vundle.vim) as a plugin manager.

The tmux configuration relies on [tpm](https://github.com/tmux-plugins/tpm) as a plugin manager.
