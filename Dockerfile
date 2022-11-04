FROM        node:18

LABEL       author="Skyz" maintainer="docker-public@skyz.xyz"

LABEL       org.opencontainers.image.source="https://github.com/thatskyz/discordjs-container"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt update \
	&& apt install -y ca-certificates curl git openssl tar tzdata iproute2 \
	&& adduser --home /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
