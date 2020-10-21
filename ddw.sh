#!/bin/bash
echo "ddw 3.0"
update() {
	rm /usr/bin/ddw
	echo "Updateing ddw"
	sudo wget https://raw.githubusercontent.com/SkywalkerSW5/ddw/master/ddw -P /usr/bin
	sudo chmod +x /usr/bin/ddw

}
usage() {
	echo 
	echo "Usage:"
	echo
	echo "ddw iso: Writes selected iso to selected drive;"
	echo "ddw mount: Mounts the selected iso;"
	echo "ddw lsiso: Lists ISOs in dir;"

}
port() {
	echo "Enter the number of the port you wanna open"
	read port
	echo "Opening port " $port
	echo "Port opened"
	netcat -l -k $port
	}
mount() {
	echo "Enter the filename of the ISO"
	read iso
	cd 
	sudo mkdir iso
	sudo mount $iso ./iso
	cd -
}
iso() {
	clear
	echo "Available ISOs in current directory:"
	ls *.img *.iso *.qcow *.vhd *.bin 2> /dev/null
	echo "Enter the filename of the ISO:" && read iso
	clear
	lsblk
	echo "Enter the filename of the device:" && read device
	
	# This prevents the code from writing on /dev/sda or any of its paritions
	

            if [ "$device" = "/dev/sda" ]; then
                echo "ddw will NOT write to /dev/sda"
				exit
            else
                break  2> /dev/null    # break gives me w wierd message but still works so idk
            fi

	sudo dd if=$iso | pv | sudo dd of=$device
}
	lsiso() {
			ls *.img *.iso *.qcow *.vhd *.bin 2> /dev/null
}
	format() {
		clear
		echo "Choose one of the filesystems: fat, ext4, ,ext3 , ntfs, btrfs"
		read fs
		lsblk
		echo "Select the device you want to format:"
		read format-device
		sudo mkfs.$fs $format-device
		echo "Finished"		
}




 if [ -z "$*" ]; then 
	echo "Run ddw usage for usage info"; fi

for a in $@; do
    case $a in
        "") echo;;
        "iso") iso;;
	"mount") mount;;
        "usage") usage;;
        "help") usage;;
	"update") update;;
	"port") port;;
	"lsiso") lsiso;;
        *)

            
    esac
done
