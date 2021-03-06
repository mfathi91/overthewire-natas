#!/bin/bash

set -e

# Returns the ASCII representation of the given hex string
# Parameter 1 - the hex string
hex2ascii(){

    local INPUT=${1}
    test $((${#INPUT} % 2)) -ne 0 && printf "hex2ascii: Invalid input.\n" >&2 && return 1
    local INPUT_ARRAY=$(echo ${INPUT} | fold -w2)
    local ASCII=""
    for HEX in ${INPUT_ARRAY[@]}; do
        ASCII=${ASCII}$(printf "\x${HEX}")
    done
    echo ${ASCII}
}

ENCODED_SECRET="3d3d516343746d4d6d6c315669563362"
ASCII=$(hex2ascii ${ENCODED_SECRET})
ASCII_REV=$(echo ${ASCII} | rev)
ASCII_REV_DECODED=$(echo ${ASCII_REV} | base64 --decode)
RESPONSE=$(curl --silent \
                --user natas8:DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe \
                --request POST \
                --data "secret=oubWYf2kBq&submit=Submit" \
                http://natas8.natas.labs.overthewire.org/)
PASSWORD=$(echo ${RESPONSE} | grep -Eo "The password for natas9 is [A-Za-z0-9]{32}" | grep -Eo [A-Za-z0-9]{32})
printf "The password for natas09 is: ${PASSWORD}\n"
