#!/bin/sh

set -eu

if [ ! -e ~/.skicka.config ]; then
    skicka init
fi

echo $SKICKA_TOKENCACHE_JSON > $HOME/.skicka.tokencache.json

if [ -n "$GOOGLE_CLIENT_ID" ]; then
    sed -i -e "s/;clientid=YOUR_GOOGLE_APP_CLIENT_ID/clientid=$GOOGLE_CLIENT_ID/" ~/.skicka.config
    sed -i -e "s/;clientsecret=YOUR_GOOGLE_APP_SECRET/clientsecret=$GOOGLE_CLIENT_SECRET/" ~/.skicka.config
fi

skicka -verbose $ACTION $ARGS 2>&1