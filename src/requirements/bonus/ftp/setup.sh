#!/bin/sh

set -xe

mkdir -p /var/www/html/wordpress

adduser -D $FTP_USER 

echo "$FTP_USER:$FTP_PASS" | chpasswd

echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "pasv_address=ftp" >> /etc/vsftpd/vsftpd.conf
echo "log_ftp_protocol=YES" >> /etc/vsftpd/vsftpd.conf
# echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf
echo "user_sub_token=$USER" >> /etc/vsftpd/vsftpd.conf
echo "local_root=/var/www/html/wordpress" >> /etc/vsftpd/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=50000" >> /etc/vsftpd/vsftpd.conf
echo "listen_ipv6=NO" >> /etc/vsftpd/vsftpd.conf
echo "listen=YES" >> /etc/vsftpd/vsftpd.conf

exec vsftpd  /etc/vsftpd/vsftpd.conf
  
