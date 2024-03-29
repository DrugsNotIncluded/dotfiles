if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
export SSH_AUTH_SOCK
PATH="${PATH}":"${HOME}"/.local/bin:"${HOME}"/node_modules/.bin:"${HOME}"/go/bin
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export XCURSOR_THEME=$(gsettings get org.gnome.desktop.interface cursor-theme)
export SDL_VIDEODRIVER=wayland 

eval "$(ssh-agent)"
