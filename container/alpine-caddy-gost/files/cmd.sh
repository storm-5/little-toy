#!/bin/sh

set -e

GOST=/root/files/gost/gost-linux-amd64-2.11.1.o
CADDY=/root/files/caddy/caddy-1.0.5.o
SED=$(which sed)


mkdir -p /usr/share/nginx
mkdir -p /var/log/caddy/
ln -s /root/files/html /usr/share/nginx/html
if [ ! -f /etc/caddy/Caddyfile ]; then
	cp /root/files/caddy/Caddyfile /etc/caddy/
fi
${SED} -i "s/{{DOMAIN}}/${DOMAIN}/g" /etc/caddy/Caddyfile
${SED} -i "s/{{FP_USER}}/${FP_USER}/g" /etc/caddy/Caddyfile
${SED} -i "s/{{FP_PASS}}/${FP_PASS}/g" /etc/caddy/Caddyfile
${SED} -i "s/{{EMAIL}}/${EMAIL}/g" /etc/caddy/Caddyfile


nohup ${CADDY} -agree -conf /etc/caddy/Caddyfile &

${GOST} -L "socks5+ws://0.0.0.0:4430?path=${WS_PATH}" -L "socks5://0.0.0.0:10800?probe_resist=code:404&knock=google.com"