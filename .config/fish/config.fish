if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias dotfiles="/usr/bin/git --git-dir=/home/rdrachmanto/.dotfiles/ --work-tree=$HOME"

# Initialize starship prompt
starship init fish | source
