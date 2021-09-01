FROM alpine:3.10.3 AS alpine-aria2
RUN apk add --no-cache nginx aria2

FROM alpine-aria2
COPY . /root/
RUN chmod +x /root/files/cmd.sh \
	&& mv /root/files/nginx/nginx.conf /etc/nginx/nginx.conf \
	&& mv /root/files/nginx/conf.d/* /etc/nginx/conf.d/ \
	&& mkdir -p /usr/share/nginx/html/ \
	&& mv /root/files/nginx/html/* /usr/share/nginx/html/ \
	&& mkdir /data

CMD [ "/root/files/cmd.sh" ]