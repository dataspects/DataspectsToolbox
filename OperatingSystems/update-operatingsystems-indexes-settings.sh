#!/bin/bash

# https://docs.meilisearch.com/reference/api/settings.html
# https://docs.meilisearch.com/learn/advanced/asynchronous_operations.html#which-operations-are-async
# https://docs.meilisearch.com/learn/core_concepts/relevancy.html

echo "Meili server and index: $DS_MEILI_SERVER and $DS_MEILI_INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

curl --silent --insecure \
  -X PATCH "$DS_MEILI_SERVER/indexes/$DS_MEILI_INDEX/settings" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "searchableAttributes": [
      "text"
    ],
    "filterableAttributes": [
      "id",
      "release_timestamp",
      "xmlTag"
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