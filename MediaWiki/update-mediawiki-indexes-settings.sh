#!/bin/bash

# https://docs.meilisearch.com/reference/api/settings.html

curl -s \
  -X POST "$MEILI_SERVER/indexes/$INDEX/settings" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "filterableAttributes": [
      "ds0__source.1v10",
      "ds0__source.1v11",
      "ds0__source.1v12",
      "ds0__source.1v13",
      "eppo0__hasEntityType",
      "eppo0__hasEntityType.1v10",
      "eppo0__hasEntityType.1v11",
      "mw0__text",
      "mw0__wikitext",
      "mw0__attachment.text",
      "mw0__attachment.type",
      "annotations.predicate",
      "annotations.objectLiteral"
    ]
  }' \
  | jq .