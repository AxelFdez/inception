#!/bin/bash

useradd -m $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
mkdir -p /var/run/vsftpd/empty
touch /etc/vsftpd.user_list
echo "$FTP_USER" > /etc/vsftpd.chroot_list
chmod 777 /var/ftp

exec "vsftpd"