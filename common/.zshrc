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

# Exports
export TERM=xterm-256color
export GSK_RENDERER=ngl

# History
HISTFILE=~/.zsh/zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/raka/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/raka/.local/share/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# Aliases and Exports
alias ls='ls --group-directories-first --color=auto'


[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
