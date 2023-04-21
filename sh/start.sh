#! /bin/bash

echo 'building src/Main.kt into hello.jar. run it with `java -jar hello.jar` in your console.'
/app/.sdkman/candidates/kotlin/current/bin/kotlinc src/main/kotlin/Main.kt -include-runtime -d hello.jar

#  let's start a basic webserver to stop Glitch from constantly restarting
source ${APP_TYPES_DIR}/utils.sh
export PATH="${PATH}:${DEFAULT_NODE_DIR}"
ws --port 3000 --log.format combined --directory . --blacklist '/.env' '/.data' '/.git' &
pid=$!

wait ${pid}