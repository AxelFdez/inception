FROM debian:buster

RUN apt-get update && \
	apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/config.sh .

RUN chmod +x config.sh

EXPOSE 20 21

ENTRYPOINT [ "./config.sh" ]