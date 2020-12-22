#!/bin/bash

# Установка пакетов для работы с NFS, создание общей папки и запуск сервисов 
yum install nfs-utils
mkdir /var/nfsshare
systemctl enable {rpcbind,nfs-server,nfs-lock,nfs-idmap}
systemctl restart {rpcbind,nfs-server,nfs-lock,nfs-idmap}

# Запись в export файл с указанием прав
echo "192.168.50.11(rw,sync)" >> /etc/exports
systemctl restart nfs-server

# Настройка файрволла на работу с NFS
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload
