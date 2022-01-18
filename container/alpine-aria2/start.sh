#!/bin/sh

HTTP_PORT=8000
ARIA2C_RPC_TOKEN=accesstoken
DOWNLOAD_DIR=/data

# run container
docker run \
	-d \
	--name alpine-aria2 \
	-p ${HTTP_PORT}:80 \
	-e ARIA2C_RPC_TOKEN=${ARIA2C_RPC_TOKEN} \
	-v ${FILEBROWSER_ROOTDIR}:/data \
	alpine-aria2
