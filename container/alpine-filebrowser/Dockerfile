FROM alpine:3.10.3 

COPY . /root/
RUN chmod +x /root/files/cmd.sh \
	&& mkdir -p /opt/filebrowser \
	&& mv /root/files/filebrowser/filebrowser /opt/filebrowser/ \
	&& mkdir /data

CMD [ "/root/files/cmd.sh" ]