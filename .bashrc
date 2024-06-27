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
alias cfg='/usr/bin/git --git-dir=/home/rdrachmanto/.cfg/ --work-tree=/home/rdrachmanto'

# starship init command
eval "$(starship init bash)"

[ -f "/home/rdrachmanto/.ghcup/env" ] && . "/home/rdrachmanto/.ghcup/env" # ghcup-env

# Ocaml OPAM env
eval "$(opam env)"

# Rye setup (python)
source "$HOME/.rye/env"
. "$HOME/.cargo/env"
