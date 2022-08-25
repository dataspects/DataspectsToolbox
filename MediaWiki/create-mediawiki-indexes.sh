#!/bin/bash

# https://docs.meilisearch.com/reference/api/indexes.html

echo "Meili server at $MEILI_SERVER"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl -s \
  -X POST "$MEILI_SERVER/indexes" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"uid\": \"$INDEX\",
    \"primaryKey\": \"id\"
  }" \
  | jq .