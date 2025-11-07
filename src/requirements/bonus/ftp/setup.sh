#!/bin/sh

set -xe

adduser -D -h /srv/ftp/wordpress -s /sbin/nologin $FTP_USER

echo "$FTP_USER:$FTP_PASS" | chpasswd

sed -i "s/IP_ADDR/$FTP_ADDR/1" /etc/vsftpd/vsftpd.conf
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

