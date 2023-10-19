set XDG_CURRENT_DESKTOP "sway" # xdg-desktop-portal
#set XDG_SESSION_DESKTOP "sway" # systemd
#set XDG_SESSION_TYPE "wayland" # xdg/systemd

# dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP="sway" XDG_SESSION_DESKTOP="sway" XDG_SESSION_TYPE="wayland"
dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP="sway"

