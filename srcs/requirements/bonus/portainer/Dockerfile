FROM debian:buster

RUN apt-get update && apt-get install -y curl

RUN curl -fsSL https://get.docker.com | sh

RUN curl -LJO "https://sourceforge.net/projects/portainer-io.mirror/files/2.19.1/portainer-2.19.1-linux-amd64.tar.gz/download"
RUN tar xzf portainer-2.19.1-linux-amd64.tar.gz
RUN mv portainer/* /usr/local/bin/

EXPOSE 9443 8000

CMD ["portainer", "-H", "unix:///var/run/docker.sock"]