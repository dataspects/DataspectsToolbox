#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

INDEX=mwstakeorg

curl --silent --insecure \
  -X POST "$DS_MEILI_SERVER/keys" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"description\": \"wgDataspectsSearchSearchKey\",
    \"actions\": [
        \"search\",
        \"stats.get\"
    ],
    \"indexes\": [\"$DS_MEILI_INDEX\"],
    \"expiresAt\": null
  }" \
  | jq .

# curl --silent --insecure \
#   -X POST "$DS_MEILI_SERVER/keys" \
#   -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
#   -H 'Content-Type: application/json' \
#   --data-binary "{
#     \"description\": \"wgDataspectsSearchWriteKey\",
#     \"actions\": [
#       \"documents.add\",
#       \"documents.delete\"
#     ],
#     \"indexes\": [\"$DS_MEILI_INDEX\"],
#     \"expiresAt\": null
#   }" \
#   | jq .

# curl --silent --insecure \
#   -X POST "$DS_MEILI_SERVER/keys" \
#   -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
#   -H 'Content-Type: application/json' \
#   --data-binary "{
#     \"description\": \"mediawiki-MASTER-key\",
#     \"actions\": [\"*\"],
#     \"indexes\": [\"$DS_MEILI_INDEX\"],
#     \"expiresAt\": null
#   }" \
#   | jq .