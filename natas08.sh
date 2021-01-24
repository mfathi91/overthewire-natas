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
printf "Enter ${ASCII_REV_DECODED} into the box to get the password for natas9.\n"
# The password for natas9 is: W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl
