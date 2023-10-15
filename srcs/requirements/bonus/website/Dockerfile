FROM debian:buster

COPY ./tools/index.html .

COPY ./tools/config.sh .

RUN apt-get update && apt-get install ftp -y && \
	chmod +x ./config.sh

ENTRYPOINT [ "./config.sh" ]