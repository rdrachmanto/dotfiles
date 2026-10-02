# Created by newuser for 5.9
# Completions
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Prompt
PROMPT='[%F{green}%n@%m%f::%F{blue}%~%f] %# '

# Movement binding like bash
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Common Aliases 
alias ls='ls --group-directories-first --color=auto'


# Exports
export TERM=xterm-256color
export GSK_RENDERER=ngl


# Sourcing
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

if [[ -d ~/.zshrc.d ]]; then
  for rc in ~/.zshrc.d/*(N.); do
    source "$rc"
  done
fi
unset rc
