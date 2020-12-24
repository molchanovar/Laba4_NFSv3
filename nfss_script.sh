#!/bin/bash

# Установка пакетов для работы с NFS, создание общей папки и запуск сервисов + права user'у nfs
yum install nfs-utils
mkdir -p /var/NFSshare
chown -R nobody: /var/NFSshare
systemctl enable {rpcbind,nfs-server,nfs-lock,nfs-idmap}
systemctl restart {rpcbind,nfs-server,nfs-lock,nfs-idmap}

# Запись в export файл с указанием прав
echo "/var/NFSshare 192.168.50.0/24(rw,sync,no_all_squash,root_squash)" >> /etc/exports
systemctl restart nfs-server

# Настройка файрволла на работу с NFS
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload
