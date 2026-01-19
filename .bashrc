# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature: export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then 
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc" 
	fi
    done
fi 
unset rc

# vterm config
vterm_printf(){ 
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1" 
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1" 
    else
        printf "\e]%s\e\\" "$1"
    fi
}

export BAT_THEME="Material-Dark"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rdrachmanto/.miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rdrachmanto/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rdrachmanto/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rdrachmanto/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# starship init command

fastfetch

export TERM=xterm-256color
# export PATH="/home/rdrachmanto/VM/ubuntu/.local/share/qlot/bin:$PATH"
export PATH="$PATH:/home/rdrachmanto/.local/share/coursier/bin"

# . "$HOME/.cargo/env"
