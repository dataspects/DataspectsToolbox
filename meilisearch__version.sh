#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

curl --silent --insecure \
  -X GET "$DS_MEILI_SERVER/version" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
   | jq .