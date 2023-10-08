if test -z "$WAYLAND_DISPLAY" ; and test "$XDG_VTNR" != "" ; and test "$XDG_VTNR" -eq 1 ; and test "$SSH_TTY" != "/dev/pts/0"
    if test (prompt_hostname) = "asahi-linux"
        sway
    else
        sway-nvidia
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
end

set fish_greeting ""
load_nvm
set -gx PYENV_ROOT "$HOME/.pyenv"
pyenv init - fish | source
alias config='/usr/bin/git --git-dir=$HOME/configs --work-tree=$HOME'

