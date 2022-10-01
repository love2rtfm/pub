#/bin/sh
#
# Create a VM with a NVME disk
# Make it UEFI booting
#
fdisk << EOF
g
n
1
+500m
t
1
n
p
2
w
EOF

mkfs.ext4 /dev/nvme0n1p2
mount /dev/nvme0n1p2 /mnt

mkfs.fat -F 32 /dev/nvme0n1p1
mount --mkdir /dev/nvme0n1p1 /mnt/boot

pacstrap /mnt base linux linux-firmware
