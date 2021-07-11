# Docking to Tor
Docker container setup for sending ssh/web/dns traffic over the Tor network on startup.<br>
## Start container
./skyhook.sh
## Proxy SSH 
ssh <strong>-o ProxyCommand="connect-proxy -H 127.0.0.11:80 %h %p"</strong> user_name@ip_address
## Screens
All services housed in screen sessions.
```bash
root@dc4e4de04191:~# screen -ls
There are screens on:
        15.dns  (07/11/21 01:24:17)     (Detached)
        9.tor   (07/11/21 01:24:17)     (Detached)
        12.socat        (07/11/21 01:24:17)     (Detached)
3 Sockets in /run/screen/S-root.
```
## Verify
```bash
root@dc4e4de04191:~# curl https://wtfismyip.com/json
{
    "YourFuckingIPAddress": "199.195.250.77",
    "YourFuckingLocation": "Unknown",
    "YourFuckingHostname": "ny1.exit.tor.alkyl.eu.org",
    "YourFuckingISP": "FranTech Solutions",
    "YourFuckingTorExit": false,
    "YourFuckingCountryCode": "Unknown"
}
```

