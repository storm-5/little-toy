FROM alpine:3.10.3 AS alpine-gost-certbot
RUN apk add --no-cache certbot

FROM alpine-gost-certbot
COPY . /root/
RUN chmod +x /root/files/cmd.sh \
	&& mkdir -p /etc/letsencrypt/live \
	&& mv /root/files/certbot/renew /etc/periodic/monthly//

CMD [ "/root/files/cmd.sh" ]