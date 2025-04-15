FROM ubuntu:24.04
LABEL com.antonraharja.image.authors="araharja@protonmail.com"

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies, prepare directories, and set up users in a single layer
RUN apt-get -y update && apt-get -y upgrade && \
    apt-get -yq install --no-install-recommends ca-certificates git unzip curl wget rsync openssh-client vim mc asterisk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./asterisk/run.sh /run.sh
COPY ./asterisk/setup.sh /setup.sh
COPY ./asterisk/daemon.sh /daemon.sh

RUN chmod +x /run.sh /setup.sh /daemon.sh

VOLUME ["/opt/asterisk"]

EXPOSE 4569/TCP 5060/UDP

# Set entrypoint
ENTRYPOINT ["/run.sh"]
