setup-alpine
apk add e2fsprogs syslinux mkinitfs wget
fdisk /dev/sda
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
mount -t ext4 /dev/sda1 /mnt
lbu package - | tar -C /mnt -zxf -
apk add --root=/mnt --initdb $(cat /etc/apk/world)
echo -e "/dev/sda1 /    ext4  defaults 1 1" >> /mnt/etc/fstab
echo -e "/dev/sda2 none swap  sw       0 0" >> /mnt/etc/fstab
cd /mnt/boot/
wget https://agui.vercel.app/extras/extlinux.conf
cd $HOME
extlinux -i /mnt/boot
dd if=/usr/share/syslinux/mbr.bin of=/dev/sda
umount /mnt
umount /.modloop
eject 
reboot
