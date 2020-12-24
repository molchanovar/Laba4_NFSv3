#!/bin/bash

# Работа по SSH
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh

# Скачивание NFS и создание общей шары 
yum install nfs-utils
mkdir -p /mnt/nfs/upload

# Монтирование текущее + после перезагрузки в fstab
mount -t nfs -o vers=3 192.168.50.10:/var/NFSshare /mnt/nfs/upload
echo "192.168.50.10:/var/NFSshare /mnt/nfs/upload nfs vers=3,rw,hard,intr,rsize=8192,wsize=8192,timeo=14 0 0" >> /etc/fstab
