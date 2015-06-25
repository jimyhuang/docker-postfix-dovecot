#!/bin/sh
docker pull jimyhuang/docker-postfix-dovecot
docker stop dovecot
docker rm dovecot
docker run \
    -dit --name dovecot \
    -p 993:993 \
    -p 587:587 \
    -e MAILNAME="static.jimmyhub.net" \
    -v /etc/postfix \
    -v /etc/ssl \
    -v /etc/opendkim \
    -v /etc/dovecot \
    -v /var/vmail:/home/vmail \
    -v /var/vmail/log:/var/log \
    jimyhuang/docker-postfix-dovecot \
    /init.sh --email test@static.jimmyhub.net --email test2@static.jimmyhub.net
docker logs -f dovecot
