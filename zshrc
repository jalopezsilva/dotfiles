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

# Default editor
export EDITOR=vim
export VISUAL=vim

# Aliases
alias ssh="TERM=screen ssh"

# Hub
eval $(hub alias -s)

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Fzf
source ~/.fzf.zsh

# rbEnv init.
eval "$(rbenv init -)"

# Prompt.
promptinit
prompt giddie

# Complete.
autoload -U compinit && compinit

