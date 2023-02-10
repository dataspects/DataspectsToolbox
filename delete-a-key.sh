#!/bin/bash

echo "Meili server and index: $DS_MEILI_SERVER and $DS_MEILI_INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl --silent --insecure \
  -X DELETE "$DS_MEILI_SERVER/keys/cnpYLMeu7ef601a49254e5edc05a6ddc3dda8d3d90a907faf66be9329d1fa00133e52707" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
   | jq .