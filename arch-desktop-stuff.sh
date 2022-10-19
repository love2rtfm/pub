#!/bin/sh
#
# curl https://raw.githubusercontent.com/love2rtfm/pub/main/arch-desktop-stuff.sh | /bin/sh
# curl -L https://tinyurl.com/2s7zhwrm | /bin/sh
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
pacman -S --noconfirm usbutils bash-completion podman traceroute base-devel git net-tools

# i3 desktop https://gist.github.com/fjpalacios/441f2f6d27f25ee238b9bfcb068865db
pacman -S --noconfirm i3

# https://low-orbit.net/arch-linux-how-to-install-i3-gaps


# nx -- Need to do this as non-priv user
#git clone https://aur.archlinux.org/nomachine.git
#cd nomachine
#makepkg -si --noconfirm
#sudo pacman -U --noconfirm nomachine*pkg*
#
#sudo systemctl enable nxserver.service
#sudo systemctl start nxserver.service
