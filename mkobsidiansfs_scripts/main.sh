#!/bin/bash
echo "> Setting up hostname"
echo "obsidian" >/etc/hostname
echo "> Changing root directory to /home/root"
mkdir -p /home/root/.local/bin
sed -i 's:/root:/home/root:g' /etc/passwd
echo "> CUSTOM SCRIPT DONE."
