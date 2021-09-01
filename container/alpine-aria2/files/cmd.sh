#!/bin/sh

# Start aria2
/usr/bin/aria2c -D --enable-rpc=true --rpc-allow-origin-all=true --rpc-listen-all=true --rpc-secret=${ARIA2C_RPC_TOKEN}

# Start nginx
/usr/sbin/nginx -g "daemon off;"
