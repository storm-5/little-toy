#!/bin/sh

HTTP_PORT=8000
ARIA2C_RPC_TOKEN=accesstoken
DOWNLOAD_DIR=/data

# run container
podman run \
	-d \
	--name alpine-aria2 \
	-p ${HTTP_PORT}:80 \
	-e ARIA2C_RPC_TOKEN=${ARIA2C_RPC_TOKEN} \
	-v ${DOWNLOAD_DIR}:/data \
	-e DOWNLOAD_DIR=/data \
	alpine-aria2
