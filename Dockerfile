FROM alpine:latest

LABEL author="notmarvin"

ARG TARGETOS
ARG TARGETARCH

# Install curl
RUN apk add --no-cache curl

# Download ngrok
RUN curl -Lo /ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-$TARGETOS-$TARGETARCH.zip \
    && unzip -o /ngrok.zip -d /bin \
    && rm -f /ngrok.zip

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY --chmod=0555 ./entrypoint.sh /entrypoint.sh
CMD "/entrypoint.sh"