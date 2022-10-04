#!/bin/bash
# https://docs.meilisearch.com/reference/api/search.html#query-parameters

echo "Meili server and index: $MEILI_SERVER and $INDEX"

# curl -s -k \
#   -X POST "$MEILI_SERVER/indexes/$INDEX/search" \
#   -H "Authorization: Bearer $MEILI_MASTER_KEY" \
#   -H 'Content-Type: application/json' \
#   --data-binary '{ "q": "affiliated", "filter": [
#         "eppo0__hasEntityType=\"Aspect\""
#     ] }' \
#    | jq .

curl -s -k \
  -X POST "$MEILI_SERVER/indexes/$INDEX/search" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{ 
    "attributesToRetrieve": ["mw0__rawUrl"],
    "filter": "(ds0__source.1v12=\"Source > https://wiki.dataspects.com/wiki/ > Main\" AND ds0__allPredicates.1v12=\"All Predicates > HasEntityType > Feature\") OR (ds0__source.1v11=\"Source > Element\")",
    "limit": 2
  }' \
   | jq .