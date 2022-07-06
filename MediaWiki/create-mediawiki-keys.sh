#!/bin/bash

# https://docs.meilisearch.com/reference/api/keys.html

curl -s \
  -X POST 'http://localhost:7700/keys' \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "description": "wgDataspectsSearchSearchKey",
    "actions": ["search"],
    "indexes": ["mediawiki"],
    "expiresAt": null
  }' \
  | jq .

curl -s \
  -X POST 'http://localhost:7700/keys' \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "description": "wgDataspectsSearchWriteKey",
    "actions": [
      "documents.add",
      "documents.delete"
    ],
    "indexes": ["mediawiki"],
    "expiresAt": null
  }' \
  | jq .

curl -s \
  -X POST 'http://localhost:7700/keys' \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "description": "mediawiki-MASTER-key",
    "actions": ["*"],
    "indexes": ["mediawiki"],
    "expiresAt": null
  }' \
  | jq .