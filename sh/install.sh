#! /bin/bash

if [ ! -d "/app/.sdkman" ]; then
  echo 'installing sdkman and kotlin'
  curl -s \"https://get.sdkman.io\" | bash
  source \"/app/.sdkman/bin/sdkman-init.sh\"
  sdk install kotlin
  sdk flush archives
else
  echo 'sdkman installed; assuming kotlin is as well'
fi
