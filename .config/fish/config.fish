if test -z "$WAYLAND_DISPLAY" ; and test "$XDG_VTNR" != "" ; and test "$XDG_VTNR" -eq 1 ; and test "$SSH_TTY" != "/dev/pts/0"
    bass source ~/.config/fish/setup_scripts/setup_sway_env.sh
    if test (prompt_hostname) = "asahi-linux"
        sway
    else
        bass source ~/.config/fish/setup_scripts/setup_nvidia_sway_env.sh
	sway --unsupported-gpu
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
end

set fish_greeting ""
set -gx PYENV_ROOT "$HOME/.pyenv"
pyenv init - fish | source
alias config='/usr/bin/git --git-dir=$HOME/configs --work-tree=$HOME'

status --is-interactive; and rbenv init - fish | source
