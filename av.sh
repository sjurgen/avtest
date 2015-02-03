#!/bin/bash
find /usr/local/ispmgr/var/userconf/ -print | while read LINE
do
 USERNAME=$(echo $LINE | awk -F'.' '{print $2}')
 USERMAIL=$(cat $LINE | grep Email | awk {'print $2'})
if ! [ -d /var/www/$USERNAME/data/quarantine/ ]; then
 mkdir /var/www/$USERNAME/data/quarantine/
fi
	maldet -co quardir=/var/www/$USERNAME/data/quarantine/,email_addr=$USERMAIL  -a /var/www/$USERNAME/data/www/vir2/ &> /tmp/scan-$USERNAME
chown -R $USERNAME:$USERNAME /var/www/$USERNAME/data/quarantine/
chmod -R 0777 /var/www/$USERNAME/data/quarantine/
done