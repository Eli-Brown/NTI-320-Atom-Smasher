#!/bin/bash
apt-get update
apt install -y nfs-client httpd
showmount -e 10.128.0.19
mkdir /mnt/test
echo "10.128.0.19:/var/nfsshare/testing     /mnt/test     nfs     defaults 0 0" >> /etc/fstab
mount -a
