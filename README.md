# ddw
## A wrapper for DD that writes ISOs to a drive

Note: This is the old version, a rewritten version is bundled with teaOS
### How to install:
#### To install;
ddw requires *wget*, and *pv* to be installed.
```sudo wget https://raw.githubusercontent.com/SkywalkerSW5/ddw/master/ddw -P /usr/bin/ && sudo chmod +x /usr/bin/ddw```
### Usage;
#### Quick Start;
The primary usage for ddw is to write ISOs to a drive. To begin this process type this;
```ddw iso```
Ddw has sudo built in. It will then list all the ISO files in the current directory. Enter the one you want:
```archlinux.iso  voidlinux.iso
Enter the ISO you want to use:
archlinux.iso ```
```
Then, it will run *lsblk*, and show you the drives to put it on;
```NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 931.5G  0 disk 
├─sda1   8:1    0   100M  0 part 
├─sda2   8:2    0    16M  0 part 
├─sda3   8:3    0 299.4G  0 part 
├─sda4   8:4    0   505M  0 part 
├─sda5   8:5    0   512M  0 part 
├─sda6   8:6    0    50G  0 part 
└─sda7   8:7    0   581G  0 part /
sdd      8:48   1  57.8G  0 disk 
├─sdd1   8:49   1   800K  0 part 
└─sdd2   8:50   1    15K  0 part 
sr0     11:0    1  1024M  0 rom  
Enter the filename of the device:
/dev/sdd
```
After that, it will burn the ISO to the drive
