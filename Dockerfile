FROM debian:stable-slim

ARG CLOUDFLARED=2021.6.0

# Backports
RUN echo 'deb http://deb.debian.org/debian buster-backports main contrib non-free' > /etc/apt/sources.list.d/buster-backports.list

# Install deps and Wireguard
RUN set -x && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update -y -q && \
    apt-get upgrade -y -q && \
    apt-get install -y -q dialog apt-utils && \
    apt-get install -y -q wget unzip screen vim ssh python3-pip wireguard tor curl iputils-ping net-tools socat netcat connect-proxy python3 jq

# Update torrc
RUN mv /etc/tor/torrc /etc/tor/torrc.orig && \
    echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc && \
    echo "Log notice file /var/log/tor/tor.log" >> /etc/tor/torrc

# DNS over HTTPS
RUN wget -q https://github.com/cloudflare/cloudflared/releases/download/${CLOUDFLARED}/cloudflared-linux-amd64 -O /root/cloudflared && \
    chmod +x /root/cloudflared && \
    mv /root/cloudflared /usr/local/sbin/

COPY ./start.sh /root/start.sh

RUN chmod 755 /root/start.sh 

WORKDIR /root/
ENTRYPOINT [ "/root/start.sh" ]