#!/bin/ash

[ -x /setup.sh ] && /setup.sh

[ -e /setup.sh ] && mv /setup.sh /backup.setup.sh && chmod 0644 /backup.setup.sh

while true; do
	if ! ps ax | grep -v grep | grep -q "asterisk"; then
		/usr/sbin/safe_asterisk -vvv
	fi
	
	sleep 3
done
