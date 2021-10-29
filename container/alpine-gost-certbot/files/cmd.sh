#!/bin/sh

set -e

CERT_DIR=/etc/letsencrypt
CERT=${CERT_DIR}/live/${DOMAIN}/fullchain.pem;
KEY=${CERT_DIR}/live/${DOMAIN}/privkey.pem;
GOST=/root/files/gost/gost-linux-amd64-2.11.1

# Get certs
if [ -d ${CERT_DIR} ]; then
	if [ ! -d ${CERT_DIR}/live/${DOMAIN} ]; then
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

# start gost
${GOST} -L "http2://${USER}:${PASS}@0.0.0.0:443?cert=${CERT}&key=${KEY}&probe_resist=code:404&knock=www.google.com" 