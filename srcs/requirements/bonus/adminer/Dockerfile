FROM debian:buster

COPY ./tools/config.sh .

RUN apt-get update && apt-get install wget ftp -y && \
	chmod +x ./config.sh

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /adminer.php

ENTRYPOINT [ "./config.sh" ]