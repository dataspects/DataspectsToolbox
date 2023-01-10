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

# https://github.com/meilisearch/charabia/blob/main/CONTRIBUTING.md

curl --silent --insecure \
  -X PATCH "$MEILI_SERVER/indexes/$INDEX/settings" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "searchableAttributes": [
      "eppo0__hasEntityTitle",
      "eppo0__hasEntityBlurb",
      "ds0__text",
      "mw0__wikitext",
      "mw0__namespace",
      "mw0__attachment.text"
    ],
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
      "ds0__specialAspect.1v10",
      "ds0__specialAspect.1v11",
      "ds0__allPredicates.1v10",
      "ds0__allPredicates.1v11",
      "ds0__allPredicates.1v12",
      "mw0__namespace",
      "mw0__attachment.type",
      "annotations.predicate",
      "annotations.objectLiteral",
      "escam0__sender",
      "escam0__room",
      "release_timestamp"
    ],
    "rankingRules": [
      "words",
      "typo",
      "proximity",
      "attribute",
      "sort",
      "exactness"
    ],
    "pagination": {
      "maxTotalHits": 10000
    }
  }' \
  | jq .