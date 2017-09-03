# zshrc - jalopezsilva@gmail.com
# Relies on prezto : https://github.com/sorin-ionescu/prezto

# Prezto {{{

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# }}}

# Aliases/Utilities {{{

# Utilities
source "${ZDOTDIR:-$HOME}/.zshutils"

# Aliases
source "${ZDOTDIR:-$HOME}/.zshaliases"

# External non-versioned utilities
[[ -f "${ZDOTDIR-$HOME}/.zshutils-ext" ]] && \
  source "${ZDOTDIR-$HOME}/.zshutils-ext"

# External non-versioned aliases
[[ -f "${ZDOTDIR-$HOME}/.zshaliases-ext" ]] && \
  source "${ZDOTDIR-$HOME}/.zshaliases-ext"

# }}}

# Settings {{{

# Default editor
export EDITOR=vim
export VISUAL=vim

# Key bindings
bindkey -e

# Prompt.
if command_exists promptinit; then
  promptinit
  prompt kylewest
  # Hacky customizations on top of prompt.
  zstyle ':prezto:module:editor:info:keymap:primary' format "%B%F{magenta}❯%f%b"
  zstyle ':prezto:module:editor:info:keymap:alternate' format "%B%F{red}❮%f%b"
  zstyle ':prezto:module:git:info:branch' format '%F{blue}%b%f'
fi

# }}}

# Tools {{{

# vim
if ! command_exists vim; then
  log_error 'Missing critical tool: vim'
fi

# tmux
if ! command_exists tmux; then
  log_error 'Missing critical tool: tmux'
fi

# j
if [[ -f /usr/share/autojump/autojump.zsh ]] ; then
  source /usr/share/autojump/autojump.zsh
else
  log_error 'Missing critical tool: autojump'
fi

# fzf
if [[ -f ~/.fzf.zsh ]] ; then
  source ~/.fzf.zsh
else
  log_error 'Missing critical tool: fzf'
fi

# Hub
if command_exists hub; then
  eval $(hub alias -s)
fi

# rbenv
if [[ -d ~/.rbenv ]] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# }}}

# vim: set foldmethod=marker:
