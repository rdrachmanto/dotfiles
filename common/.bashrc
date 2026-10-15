# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# change bash prompt
# export PS1="[\[\e[0;32m\]\u@\h[\e[0m\]::\[\e[0;34m\]\w\[\e[0m\]] \$ "
export PS1="[\[\e[0;32m\]\u@\h\[\e[0m\]::\[\e[0;34m\]\w\[\e[0m\]] \$ "

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
