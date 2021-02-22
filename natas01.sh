#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas1:gtVrDuiDfck831PqWsLEZy5gyDz1clto \
                http://natas1.natas.labs.overthewire.org/)
PASSWORD=$(echo ${RESPONSE} | grep -Po "(?<=The password for natas2 is )[A-Za-z0-9]{32}")
printf "The password for natas02 is: ${PASSWORD}\n"
