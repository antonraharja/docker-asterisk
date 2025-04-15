#!/bin/ash

mkdir -p /opt/asterisk
rm -rf /opt/asterisk/*

mkdir -p /opt/asterisk/etc
rsync -az /etc/asterisk/ /opt/asterisk/etc/
rm -rf /etc/asterisk
ln -s /opt/asterisk/etc /etc/asterisk

mkdir -p /opt/asterisk/lib
rsync -az /var/lib/asterisk/ /opt/asterisk/lib/
rm -rf /var/lib/asterisk
ln -s /opt/asterisk/lib /var/lib/asterisk

mkdir -p /opt/asterisk/log
rsync -az /var/log/asterisk/ /opt/asterisk/log/
rm -rf /var/log/asterisk
ln -s /opt/asterisk/log /var/log/asterisk
