if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
export SSH_AUTH_SOCK
PATH="${PATH}":"${HOME}"/.local/bin:"${HOME}"/node_modules/.bin:"${HOME}"/go/bin
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME=qt5ct
export XCURSOR_THEME=$(gsettings get org.gnome.desktop.interface cursor-theme)

# Start SSH agent
eval "$(ssh-agent)"

# Add DrugsNotIncluded github key
cat /home/ssh_keys/coffeebook | ssh-add -
