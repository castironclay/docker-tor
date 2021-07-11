#!/bin/bash
docker run -it --cap-add=NET_ADMIN \
        --dns 127.0.0.1 \
        --add-host socks5h:127.0.0.11 \
        --add-host dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion:127.0.0.1 \
	      docker-tor /bin/bash