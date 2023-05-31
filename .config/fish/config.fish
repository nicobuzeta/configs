if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
end

set fish_greeting ""
load_nvm
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
