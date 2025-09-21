#!/bin/sh
mkdir -p /usr/share/wallpapers/obos/
cp /root/custom_scripts/obos.png /usr/share/wallpapers/obos/obos.png
mkdir -p /home/user/.config/
cat > /home/user/.config/plasmarc <<EOF
[Wallpapers]
usersWallpapers=/usr/share/wallpapers/obos/obos.png
EOF
chown user:user /home/user/.config/plasmarc
chmod -R 644 /home/user/
chmod 644 /usr/share/wallpapers/obos/obos.png
