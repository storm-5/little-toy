#!/bin/sh

DOMAIN=example.com
EMAIL=user@gmail.com
FP_USER=user
FP_PASS=password
HTTP_PORT=8000
HTTPS_PORT=44300
Caddy_CONF_DIR="./files/caddy/"
LETSENCRYPT_DIR="./files/letsencrypt/"

# run container
docker run \
	-d \
	--name alpine-caddy-gost \
	-v ${Caddy_CONF_DIR}:/etc/caddy:Z \
	-v ${LETSENCRYPT_DIR}:/root/.caddy:Z \
	-p ${HTTP_PORT}:80 \
	-p ${HTTPS_PORT}:443 \
	-e DOMAIN=${DOMAIN} \
	-e EMAIL=${EMAIL} \
	-e FP_USER=${FP_USER} \
	-e FP_PASS=${FP_PASS} \
	alpine-caddy-gost