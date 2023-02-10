#!/bin/bash

echo "Meili server and index: $DS_MEILI_SERVER and $DS_MEILI_INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl --silent --insecure \
  -X DELETE "$DS_MEILI_SERVER/indexes/$DS_MEILI_INDEX/documents" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
   | jq .