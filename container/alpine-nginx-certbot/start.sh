#!/bin/sh

DOMAIN=example.com
EMAIL=user@gmail.com
HTTP_PORT=80
HTTPS_PORT=443
LETSENCRYPT_DIR="./files/letsencrypt/"
WEBSOCKET_SERVER="localhost:8000"

# run container
docker run \
	-d \
	--name alpine-nginx-certbot \
	-v ${LETSENCRYPT_DIR}:/etc/letsencrypt/ \
	-p ${HTTP_PORT}:80 \
	-p ${HTTPS_PORT}:443 \
	-e WEBSOCKET_SERVER=${WEBSOCKET_SERVER} \
	-e DOMAIN=${DOMAIN} \
	-e EMAIL=${EMAIL} \
	alpine-nginx-certbot
