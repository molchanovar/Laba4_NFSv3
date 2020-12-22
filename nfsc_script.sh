#!/bin/bash

yum install nfs-utils
mkdir -p /mnt/nfs/upload

# Монтирование текущее + после перезагрузки в fstab
mount -t nfs 192.168.50.10:/var/NFSshare /mnt/nfs/upload
echo "192.168.50.10:/var/NFSshare /mnt/nfs//mnt/nfs/upload nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14 0 0" >> /etc/fstab
