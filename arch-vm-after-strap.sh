#/bin/sh
#
# curl https://raw.githubusercontent.com/love2rtfm/pub/main/arch-vm-after-strap.sh | /bin/sh
# curl -L tinyurl.com/3j7z5sd7 | /bin/sh
#
# Use this after you strap the box with pacstrap
#
# Sets root password to "changeme"

arch-chroot /mnt

rm -rf /etc/pacman.d/gnupg/
pacman-key --init
pacman-key --populate archlinux
pacman -Sc --noconfirm
pacman -Syyu

pacman -S --noconfirm texinfo man-pages man-db vim dhcpcd networkmanager grub efibootmgr inetutils

ln -sf /usr/share/zoneinfo/America/Vancouver /etc/localtime

# hwclock --systohc # not for VM

locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "archbox" > /etc/hostname

mkinitcpio -P

echo "root:changeme" | chpasswd

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# network
systemctl enable NetworkManager
systemctl start NetworkManager

# Leave chroot
exit

genfstab -U /mnt >> /mnt/etc/fstab

umount -R /mnt

# reboot
