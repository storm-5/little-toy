#!/bin/sh

DOMAIN=example.com
EMAIL=user@gmail.com
HTTP_PORT=80
HTTPS_PORT=443
LETSENCRYPT_DIR="./files/letsencrypt/"
NGINX_DIR="./files/nginx/conf.d/"
NGINX_HTML_DIR="./files/nginx/html/"
WEBSOCKET_SERVER="localhost:8000"

# run container
docker run \
	-d \
	--name alpine-nginx-certbot \
	-v ${LETSENCRYPT_DIR}:/etc/letsencrypt:z \
	-v ${NGINX_DIR}:/etc/nginx/conf.d:z \
	-v ${NGINX_HTML_DIR}:/usr/share/nginx/html:z \
	-p ${HTTP_PORT}:80 \
	-p ${HTTPS_PORT}:443 \
	-e WEBSOCKET_SERVER=${WEBSOCKET_SERVER} \
	-e DOMAIN=${DOMAIN} \
	-e EMAIL=${EMAIL} \
	alpine-nginx-certbot
