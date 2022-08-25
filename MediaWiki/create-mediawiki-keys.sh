#!/bin/bash

# https://docs.meilisearch.com/reference/api/keys.html

echo "Meili server and index: $MEILI_SERVER and $INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl -s \
  -X POST "$MEILI_SERVER/keys" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"description\": \"wgDataspectsSearchSearchKey\",
    \"actions\": [\"search\"],
    \"indexes\": [\"$INDEX\"],
    \"expiresAt\": null
  }" \
  | jq .

curl -s \
  -X POST "$MEILI_SERVER/keys" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"description\": \"wgDataspectsSearchWriteKey\",
    \"actions\": [
      \"documents.add\",
      \"documents.delete\"
    ],
    \"indexes\": [\"$INDEX\"],
    \"expiresAt\": null
  }" \
  | jq .

curl -s \
  -X POST "$MEILI_SERVER/keys" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"description\": \"mediawiki-MASTER-key\",
    \"actions\": [\"*\"],
    \"indexes\": [\"$INDEX\"],
    \"expiresAt\": null
  }" \
  | jq .