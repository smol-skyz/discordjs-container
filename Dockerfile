FROM        --platform=$TARGETOS/$TARGETARCH node:18-alpine

LABEL       author="Skyz" maintainer="docker-public@skyz.xyz"

LABEL       org.opencontainers.image.source="https://github.com/thatskyz/discordjs-container"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt add --update --no-cache ca-certificates curl git openssl sqlite tar tzdata \
	&& adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
