#!/bin/bash

echo "Meili server and index: $MEILI_SERVER and $INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl --silent --insecure \
  -X GET "$MEILI_SERVER/health" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .