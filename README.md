# Laba4_NFSv3
NFSv3 on UDP + firewall

VagrantFile поднимает 2 виртуалки: сервер (nfss) и клиент (nfsc)
На сервере расшарена директория (/var/nfs)
На клиенте она автоматически монтируется при старте системы (fstab или autofs ???)
В шаре должна быть папка upload с правами на запись

Конфигурация NFS: NFSv3 по UDP, включенный firewall
