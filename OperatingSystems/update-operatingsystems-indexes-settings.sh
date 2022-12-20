#!/bin/bash

# https://docs.meilisearch.com/reference/api/settings.html
# https://docs.meilisearch.com/learn/advanced/asynchronous_operations.html#which-operations-are-async
# https://docs.meilisearch.com/learn/core_concepts/relevancy.html

echo "Meili server and index: $MEILI_SERVER and $INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl -s -k \
  -X PATCH "$MEILI_SERVER/indexes/$INDEX/settings" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "searchableAttributes": [
      "text"
    ],
    "filterableAttributes": [
    ],
    "rankingRules": [
      "text:desc",
      "words",
      "typo",
      "proximity",
      "attribute",
      "sort",
      "exactness"
    ]
  }' \
  | jq .