#!/bin/sh

if [ ! -f /etc/vsftpd/.my_ftp_config_ok ]; then
	adduser $FTP_USER -g "$FTP_USER FTP,Room,Phone,HomePhone" --disabled-password
    echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd
    chown -R $FTP_USER:$FTP_USER /var/www/html
	echo $FTP_USER >> /etc/vsftpd_userlist
	echo "pasv_address=127.0.0.1" >> /etc/vsftpd/vsftpd.conf
	touch /etc/vsftpd/.my_ftp_config_ok
fi

echo "VSFTPD started, listen on port 21"
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
