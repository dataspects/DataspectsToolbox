#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

GET="$DS_MEILI_SERVER/indexes/$DS_MEILI_INDEX/stats"

curl --silent --insecure \
  -X GET $GET \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
   | jq .

echo "Above you see the stats at $GET"