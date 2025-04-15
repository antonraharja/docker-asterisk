FROM alpine:latest
LABEL com.antonraharja.image.authors="araharja@protonmail.com"

# Install dependencies, prepare directories, and set up users in a single layer
RUN apk update && apk upgrade && \
    apk add git unzip curl wget rsync openssh-client vim mc \
    asterisk asterisk-sample-config asterisk-sounds-en asterisk-sounds-moh asterisk-srtp

COPY ./asterisk/run.sh /run.sh
COPY ./asterisk/setup.sh /setup.sh
COPY ./asterisk/daemon.sh /daemon.sh

RUN chmod +x /run.sh /setup.sh /daemon.sh

VOLUME ["/opt/asterisk"]

EXPOSE 4569/TCP 5060/UDP

# Set entrypoint
ENTRYPOINT ["/run.sh"]
