#!/bin/bash
GREEN='\033[0;32m'

printf "${GREEN}[+] Configuring Tor and DoH...\n"
export ALL_PROXY=socks5h://127.0.0.1:9050
export HTTPS_PROXY=socks5h://127.0.0.1:9050
export HTTP_PROXY=socks5h://127.0.0.1:9050
screen -S tor -dm tor --HTTPTunnelPort 127.0.0.11:80
screen -S socat -dm socat TCP4-LISTEN:443,reuseaddr,fork SOCKS4A:127.0.0.1:dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion:443,socksport=9150
screen -S dns -dm cloudflared proxy-dns --upstream "https://dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion/dns-query"
sleep 5
curl https://www.wtfismyip.com/json
/bin/bash