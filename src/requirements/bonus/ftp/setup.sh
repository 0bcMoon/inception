#!/bin/sh

set -x

adduser -D $FTP_USER

echo "$FTP_USER:$FTP_PASS" | chpasswd

echo "listen=YES" >> /etc/vsftpd/vsftpd.conf
echo "listen_ipv6=NO" >> /etc/vsftpd/vsftpd.conf
echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf
echo "pasv_enable=Yes" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=21000" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=21005" >> /etc/vsftpd/vsftpd.conf
echo "pasv_addr_resolve=YES" >> /etc/vsftpd/vsftpd.conf
echo "pasv_address=ftp" >> /etc/vsftpd/vsftpd.conf
echo "local_root=/var/www/html/wordpress" >> /etc/vsftpd/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
