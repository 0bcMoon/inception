#!/bin/sh

set -xe

adduser -D -h /srv/ftp/wordpress -s /sbin/nologin $FTP_USER

echo "$FTP_USER:$FTP_PASS" | chpasswd

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
