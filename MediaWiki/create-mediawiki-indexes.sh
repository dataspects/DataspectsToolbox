#!/bin/bash

# https://docs.meilisearch.com/reference/api/indexes.html

curl -s \
  -X POST 'http://localhost:7700/indexes' \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "uid": "mediawiki",
    "primaryKey": "id"
  }' \
  | jq .