#! /bin/bash
sudo apt-get install -y xfsprogs
sudo modprobe -v xfs
sudo parted /dev/sdc --script mklabel gpt mkpart xfspart xfs 0% 100%
sudo mkfs.xfs /dev/sdc1
sudo partprobe /dev/sdc1
sudo mkdir /data_disk
sudo mount /dev/sdc1 /data_disk