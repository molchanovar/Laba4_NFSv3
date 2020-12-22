#!/bin/bash

yum install nfs-utils
mkdir -p /mnt/nfs/upload
mount -t nfs 192.168.50.10:/var/NFSshare /mnt/nfs/upload
