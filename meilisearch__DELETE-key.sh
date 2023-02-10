#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

KEYID="83d46ac7-1ae8-4fb8-9cac-91b8537136fe"
URL=$DS_MEILI_SERVER/keys/$KEYID

echo "URL $URL"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl --silent --insecure \
  -X DELETE $URL \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
  | jq .