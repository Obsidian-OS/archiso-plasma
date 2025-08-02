#!/bin/bash
echo "obsidian" >/etc/hostname
mkdir -p /home/root/.local/bin
sed -i 's:/root:/home/root:g' /etc/passwd
curl https://github.com/pkgforge/soar/releases/latest/download/soar-x86_64-linux -o /home/root/.local/bin/soar
chmod +x /home/root/.local/bin/soar
echo -e "export PATH=\$PATH:/home/root/.local/bin/\necho \"Soar has been installed on this system onto \$HOME/.local/bin/soar and should be in your PATH. \" " >/home/root/.bashrc
