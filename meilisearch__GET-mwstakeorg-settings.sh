#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

INDEX=mwstakeorg

curl --silent --insecure \
  -X GET "$DS_MEILI_SERVER/indexes/$DS_MEILI_INDEX/settings" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
   | jq .