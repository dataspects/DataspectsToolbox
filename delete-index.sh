#!/bin/bash

echo "Meili server at $MEILI_SERVER"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl -s \
  -X DELETE "$MEILI_SERVER/indexes/$INDEX" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .