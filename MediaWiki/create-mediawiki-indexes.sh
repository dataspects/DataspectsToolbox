#!/bin/bash

# https://docs.meilisearch.com/reference/api/indexes.html

curl -s \
  -X POST "$MEILI_SERVER/indexes" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"uid\": \"$INDEX\",
    \"primaryKey\": \"id\"
  }" \
  | jq .