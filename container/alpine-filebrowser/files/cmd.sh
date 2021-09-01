#!/bin/sh


set -e

FBEXE=/opt/filebrowser/filebrowser

# Start filebrowser
${FBEXE} -a 0.0.0.0 --baseurl=/filebrowser --database=/opt/filebrowser/filebrowser.db --root=/data --username=${FILEBROWSER_USER} --password=`${FBEXE} hash ${FILEBROWSER_PASS}`
