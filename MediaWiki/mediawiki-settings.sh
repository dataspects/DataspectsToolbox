#!/bin/bash

echo "Meili server at $MEILI_SERVER"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl -s \
  -X GET "$MEILI_SERVER/indexes/$INDEX/settings" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .