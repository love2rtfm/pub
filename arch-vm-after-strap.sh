#/bin/sh
#
# curl https://raw.githubusercontent.com/love2rtfm/pub/main/arch-vm-after-strap.sh | /bin/sh
#
# Use this after you strap the box with pacstrap

arch-chroot /mnt
pacman -S texinfo man-pages man-db vim dhcpcd networkmanager grub efibootmgr inetutils

ln -sf /usr/share/zoneinfo/America/Vancouver /etc/localtime

# hwclock --systohc # not for VM

locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "archbox" > /etc/hostname

mkinitcpio -P

echo "root:changeme" | chpasswd

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

exit
# Leave chroot

genfstab -U /mnt >> /mnt/etc/fstab

umount -R /mnt

# reboot
