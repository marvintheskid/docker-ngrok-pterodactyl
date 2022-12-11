FROM alpine:latest

LABEL author="notmarvin"

RUN curl -Lo /ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-${TARGETOS}-${TARGETARCH}.zip \
    && unzip -o /ngrok.zip -d /bin \
    && rm -f /ngrok.zip

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

CMD "/entrypoint.sh"