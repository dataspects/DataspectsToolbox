#!/bin/bash

echo "Meili server at $MEILI_SERVER"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl -s \
  -X DELETE "$MEILI_SERVER/keys/cnpYLMeu7ef601a49254e5edc05a6ddc3dda8d3d90a907faf66be9329d1fa00133e52707" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .