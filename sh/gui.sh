apk add xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter dbus
rc-service dbus start
rc-update add dbus
rc-update add udev
rc-service lightdm start
rc-update add lightdm
apk add elogind polkit-elogind
apk add gvfs udisks2
apk add gvfs-smb
apk add gvfs-fuse
apk add fuse-openrc
rc-service fuse start
rc-update add fuse
apk add adwaita-icon-theme
lbu commit
reboot