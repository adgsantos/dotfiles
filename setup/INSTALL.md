# 1. Get partitions ready

### Create partitions (ncurses)
##### Create the following partitions:
```sh
cgdisk /dev/sdX # where X stamds for the drive where the partitions should be created
```

- boot (code `EF00`)
- swap (code `8200`)
- root (code `8300`)
- home (code `8300`)

### Create filesystems
```sh
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
mkswap /dev/sda2
swapon /dev/sda2
```

### Mount the partitions
```sh
mount /dev/sdXY /mnt # where X is the disk where the partitions are and Y is the root device no
mkdir /mnt/{home,boot}
mount /dev/sdXZ /mnt/boot
mount /dev/sdXW /mnt/home
```

# 2. Installing base system
### Setup internet connection
```sh
ip link # lists internet interfaces
systemctl start dhcpcd@<INTERFACE_NAME> # connect to it
```

### Install base system
```sh
pacstrap -i /mnt base base-devel linux linux-firmware
```

### Generate fstab file
```sh
genfstab -U -p /mnt >> /mnt/etc/fstab
```
**WARN**: Don't forget to delete the swap partition on the fstab file

(If you don't you can always do it later, it's not a problem)

### Configuring system
```sh
arch-chroot /mnt
```

#### Locale
```sh
vim /etc/locale.gen # and uncomment the line which contains the desired locale
logale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
```
#### Timezone
```sh
ln -s /usr/share/zoneinfo/Portugal /etc/localtime
```

#### Hostname
```sh
echo <HOSTNAME> > /etc/hostname
```

#### Pacman
```sh
vim /etc/pacman.conf
```

Uncomment:
```
# In the misc section
Color
TotalDownload
CheckSpace
VerbosePkgLists

# In the repositories section
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Add:
```
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
```

Update it:
```sh
pacman -Sy
```

### Users
```sh
passwd # set root pw
```

Create another user with password:
```sh
useradd -m -g users -G wheel -s /bin/bash <username>
passwd <username>
```

Setup sudoers:
```sh
visudo
```
Uncomment the line:
```
%wheel ALL=(ALL) ALL
```
Add below that line:
```
Defaults rootpw
```

### efibootmgr
```sh
pacman -S efibootmgr
```

### Intel ucode
```sh
pacman -S intel-ucode
```

### Download refind
```sh
wget -q -O refind.zip 'https://sourceforge.net/projects/refind/files/0.11.3/refind-bin-0.11.3.zip/download'
unzip refind.zip
./refind-*/refind-install
```

### Install refind themes
```sh
cd /boot/EFI/BOOT
mkdir -p themes
cd themes
git clone https://github.com/EvanPurkhiser/rEFInd-minimal
```

### Create an entry with the following content:
```sh
menuentry Arch {
    icon /EFI/refind/themes/rEFInd-minimal/icons/os_arch.png
    loader /vmlinuz-linux
    initrd /intel-ucode.img # If it was installed
    initrd /initramfs-linux.img
    options "rw root=/dev/sdXY resume=/dev/sdXW" # Y - root; W - swap
}
```
### Add this at the end of the file:
`include themes/rEFInd-minimal/theme.conf`

### Modify /etc/mkinitcpio.conf
add `resume` in `HOOKS` after `udev` like so:
`HOOKS="base udev **resume** autodetect modconf block filesystems keyboard fsck"`

rebuild it:
`mkinitcpio -p linux`


### Pos-installation configuration

### Install yaourt
```sh
yaourt -S --noconfirm \
	linux-headers \
	dialog \
	wpa_supplicant \
	networkmanager

systemctl start NetworkManager.service
systemctl enable NetworkManager.service
```

### Install broadcom drivers
```sh
yaourt -S --noconfirm broadcom-wl-dkms
```
