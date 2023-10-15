FROM debian:buster

RUN apt-get update && \
	apt-get install -y vsftpd

# RUN	useradd -m ftpuser && \
#  	echo "ftpuser:pass" | chpasswd && \
# # 	adduser ftpuser sudo
# 	 mkdir -p /var/run/vsftpd/empty && \
# 	 touch /etc/vsftpd.user_list && \
# 	 echo "ftpuser" > /etc/vsftpd.chroot_list && \
# 	 chmod 777 /var/ftp && \
# 	 rm /var/ftp/index.php

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/config.sh .

RUN chmod +x config.sh

#RUN  chmod 755 /etc/vsftpd.conf
# chown ftpuser:ftpuser /etc/vsftpd.conf &&
#USER ftpuser

EXPOSE 20 21

ENTRYPOINT [ "./config.sh" ]