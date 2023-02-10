#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

echo "Meili server and index: $DS_MEILI_SERVER and $DS_MEILI_INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl --silent --insecure \
  -X POST "$DS_MEILI_SERVER/keys" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"description\": \"wgDataspectsSearchSearchKey\",
    \"actions\": [\"search\", \"stats.get\"],
    \"indexes\": [\"$DS_MEILI_INDEX\"],
    \"expiresAt\": null
  }" \
  | jq .

curl --silent --insecure \
  -X POST "$DS_MEILI_SERVER/keys" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"description\": \"wgDataspectsSearchWriteKey\",
    \"actions\": [
      \"documents.add\",
      \"documents.delete\"
    ],
    \"indexes\": [\"$DS_MEILI_INDEX\"],
    \"expiresAt\": null
  }" \
  | jq .

curl --silent --insecure \
  -X POST "$DS_MEILI_SERVER/keys" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"description\": \"mediawiki-MASTER-key\",
    \"actions\": [\"*\"],
    \"indexes\": [\"$DS_MEILI_INDEX\"],
    \"expiresAt\": null
  }" \
  | jq .