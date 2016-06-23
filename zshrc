#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source "${ZDOTDIR:-$HOME}/.zshutils"

# Default editor
export EDITOR=vim
export VISUAL=vim

# Key bindings
set -o vi

# Hub
if command_exists hub; then
  eval $(hub alias -s)
fi

# Autojump j
[[ -f /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# Fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# rbenv
if command_exists rbenv; then
  eval "$(rbenv init -)"
fi

# Prompt.
if command_exists promptinit; then
  promptinit
  prompt kylewest
fi

source "${ZDOTDIR:-$HOME}/.zshaliases"
