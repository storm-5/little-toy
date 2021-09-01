FROM alpine:3.10.3 AS alpine-nginx-certbot
RUN apk add --no-cache certbot certbot-nginx nginx sed

FROM alpine-nginx-certbot
COPY . /root/
RUN chmod +x /root/files/cmd.sh \
	&& mv /root/files/nginx/nginx.conf /etc/nginx/nginx.conf \
	&& mv /root/files/nginx/conf.d/* /etc/nginx/conf.d/ \
	&& mkdir -p /usr/share/nginx/html/ \
	&& mv /root/files/nginx/html/* /usr/share/nginx/html/ \
	&& mkdir -p /etc/letsencrypt/live \
	&& mv /root/files/certbot/renew /etc/periodic/daily/

CMD [ "/root/files/cmd.sh" ]