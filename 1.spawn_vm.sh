#!/bin/bash

 sudo incus launch images:fedora/43 \
     fedora --vm -c limits.memory=4GB \
     -c limits.cpu=4 \
     -d root,size=40GiB \
     -c security.secureboot=false

sleep 15

sudo incus exec fedora -- /bin/bash -c "dnf install openssh-server cloud-utils-growpart e2fsprogs python3 -y"
sudo incus exec fedora -- /bin/bash -c "growpart /dev/sda 2"
sudo incus exec fedora -- /bin/bash -c "resize2fs /dev/sda2"
sudo incus exec fedora -- /bin/bash -c "sed -i 's/^#\(PasswordAuthentication\).*/\1 yes/' /etc/ssh/sshd_config"
sudo incus exec fedora -- /bin/bash -c "sed -i 's/^#\(PermitRootLogin\).*/\1 yes/' /etc/ssh/sshd_config"
sudo incus exec fedora -- /bin/bash -c "echo 'root' | passwd --stdin"
sudo incus exec fedora -- /bin/bash -c "systemctl enable --now sshd"
sudo incus exec fedora -- /bin/bash -c "echo 'sebbe ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/sebbe"
