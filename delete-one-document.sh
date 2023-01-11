#!/bin/bash

echo "Meili server and index: $MEILI_SERVER and $INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

DOCUMENT_ID="mwstakeorg_440"

curl --silent --insecure \
  -X DELETE "$MEILI_SERVER/indexes/$INDEX/documents/$DOCUMENT_ID" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .