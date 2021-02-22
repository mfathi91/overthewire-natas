#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas0:natas0 \
                http://natas0.natas.labs.overthewire.org/)
PASSWORD=$(echo ${RESPONSE} | grep -Eo "[A-Za-z0-9]{32}")
printf "The password for natas01 is: ${PASSWORD}\n"
