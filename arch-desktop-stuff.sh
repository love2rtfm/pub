#!/bin/sh
#
# curl https://raw.githubusercontent.com/love2rtfm/pub/main/arch-desktop-stuff.sh | /bin/sh
#

useradd -G wheel -m e
echo "e:changeme" | chpasswd

echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

# sshd
pacman -S --noconfirm openssh
systemctl enable sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
systemctl start sshd

# extra stuff
pacman -S --noconfirm usbutils bash-completion podman traceroute base-devel git

# i3 desktop
pacman -S --noconfirm i3

# nx -- Need to do this as non-priv user
#git clone https://aur.archlinux.org/nomachine.git
#cd nomachine
#makepkg -si --noconfirm
#sudo pacman -U --noconfirm nomachine*pkg*xz
#
#sudo systemctl enable nxserver.service
#sudo systemctl start nxserver.service
