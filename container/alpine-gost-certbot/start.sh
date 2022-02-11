#!/bin/sh

DOMAIN=example.com
EMAIL=user@gmail.com
USER=user
PASS=password
HTTP_PORT=80
HTTPS_PORT=443
LETSENCRYPT_DIR="$(pwd)/files/letsencrypt/"

# run container
podman run \
	-d \
	--name alpine-gost-certbot \
	-v ${LETSENCRYPT_DIR}:/etc/letsencrypt/ \
	-p ${HTTP_PORT}:80 \
	-p ${HTTPS_PORT}:443 \
	-e DOMAIN=${DOMAIN} \
	-e EMAIL=${EMAIL} \
	-e USER=${USER} \
	-e PASS=${PASS} \
	alpine-gost-certbot
