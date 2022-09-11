#!/bin/bash

# https://docs.meilisearch.com/reference/api/settings.html

echo "Meili server and index: $MEILI_SERVER and $INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl -s \
  -X PATCH "$MEILI_SERVER/indexes/$INDEX/settings" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "filterableAttributes": [
      "ds0__source",
      "ds0__source.1v10",
      "ds0__source.1v11",
      "ds0__source.1v12",
      "ds0__source.1v13",
      "eppo0__hasEntityType",
      "eppo0__hasEntityType.1v10",
      "eppo0__hasEntityType.1v11",
      "eppo0__hasEntityType.1v12",
      "ck0__containsCognitiveKeyword.1v10",
      "ck0__containsCognitiveKeyword.1v11",
      "ds0__featuresAction.1v10",
      "ds0__featuresAction.1v11",
      "ds0__text",
      "mw0__wikitext",
      "mw0__attachment.text",
      "mw0__attachment.type",
      "annotations.predicate",
      "annotations.objectLiteral",
      "escam0__sender",
      "escam0__room"
    ]
  }' \
  | jq .