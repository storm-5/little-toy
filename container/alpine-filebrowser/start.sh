#!/bin/sh

HTTP_PORT=8010
FILEBROWSER_USER=user
FILEBROWSER_PASS=pass
FILEBROWSER_ROOTDIR=/

# run container
podman run \
	--rm -it \
	--name alpine-filebrowser \
	-p ${HTTP_PORT}:8080 \
	-e FILEBROWSER_USER=${FILEBROWSER_USER} \
	-e FILEBROWSER_PASS=${FILEBROWSER_PASS} \
	-v ${FILEBROWSER_ROOTDIR}:/data \
	alpine-filebrowser
