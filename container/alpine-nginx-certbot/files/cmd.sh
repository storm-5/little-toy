#!/bin/sh

set -e

SED=`which sed`
CERT_DIR=/etc/letsencrypt

# Get certs
if [ -d ${CERT_DIR} ]; then
	if [ ! -d ${CERT_DIR}/live/${DOMAIN} ]; then
		/bin/cp /etc/nginx/conf.d/example.conf.template /etc/nginx/conf.d/${DOMAIN}.conf
		${SED} -i "s/{{DOMAIN}}/${DOMAIN}/g" /etc/nginx/conf.d/${DOMAIN}.conf
		${SED} -i "s/{{WEBSOCKET_SERVER}}/${WEBSOCKET_SERVER}/g" /etc/nginx/conf.d/${DOMAIN}.conf
		/usr/bin/certbot certonly --standalone --preferred-challenges http \
			-n -d ${DOMAIN} --email ${EMAIL} --agree-tos --expand
	else 
		echo "cert exist. use exist."
	fi
else 
	echo "/etc/letsencrypt not exist"
	exit 1
fi

# Kick off cron
/usr/sbin/crond -f -d 8 &

# Start nginx
/usr/sbin/nginx -g "daemon off;"
