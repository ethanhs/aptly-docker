FROM ubuntu:20.04

# Install a few pre-reqs
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    ca-certificates gnupg

# Add the aptly source and key
COPY pubkey.txt /usr/share/keyrings/aptly.asc
COPY aptly.list /etc/apt/sources.list.d/aptly.list

# Install aptly
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    aptly \
    && rm -rf /var/lib/apt/lists/* \ 
    && apt-get clean

ENTRYPOINT ["/usr/bin/aptly", "-config", "/etc/aptly.conf"]

