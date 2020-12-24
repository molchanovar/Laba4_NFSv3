# Laba4_NFSv3
NFSv3 on UDP + firewall

Для запуска скачать и распаковать архив. Далее запустить виртуалки и поочереди зайти на сервер (nfss) и клиент (nfsc):
```
vagrant up
vagrant ssh nfss
vagrant ssh nfsc
```

VagrantFile поднимает 2 виртуалки: скрипты для сервера (nfss.sh) и клиента (nfsc.sh)
#### nfss ip: "192.168.50.10"
#### nfsc ip: "192.168.50.11"

На сервере расшарена директория (/var/NFSshare)
```
[root@nfss vagrant]# exportfs -s
/var/NFSshare  192.168.50.0/24(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,root_squash,no_all_squash)
```

На клиенте она автоматически монтируется при старте системы (fstab)

```
192.168.50.10:/var/NFSshare /mnt/nfs/upload nfs vers=3,rw,hard,intr,rsize=8192,wsize=8192,timeo=14 0 0
```

В шаре папка /mnt/nfs/upload с правами на запись:

```
192.168.50.10:/var/NFSshare on /mnt/nfs/upload type nfs (rw,relatime,vers=3,rsize=32768,wsize=32768,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=192.168.50.10,mountvers=3,mountport=20048,mountproto=udp,local_lock=none,addr=192.168.50.10)
```


Конфигурация NFS: NFSv3 по UDP, включенный firewall
```
rw,vers=3,mountproto=udp
firewall-cmd --add-service=nfs
firewall-cmd --add-service=rpc-bind
firewall-cmd --add-service=mountd
```
