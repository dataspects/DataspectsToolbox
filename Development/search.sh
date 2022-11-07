#!/bin/bash

TERM="Canasta"
echo "Meili server and index: $MEILI_SERVER and $INDEX"

# curl -s -k \
#   -X POST "$MEILI_SERVER/indexes/$INDEX/search" \
#   -H "Authorization: Bearer $MEILI_MASTER_KEY" \
#   -H 'Content-Type: application/json' \
#   --data-binary '{ "q": "affiliated", "filter": [
#         "eppo0__hasEntityType=\"Aspect\""
#     ] }' \
#    | jq .

# curl -s -k \
#   -X POST "$MEILI_SERVER/indexes/$INDEX/search" \
#   -H "Authorization: Bearer $MEILI_MASTER_KEY" \
#   -H 'Content-Type: application/json' \
#   --data-binary "{
#      \"q\": \"$TERM\",
#     \"limit\": 4,
#     \"filter\": \"release_timestamp >= 1514761200\",
#     \"attributesToRetrieve\": [
#       \"eppo0__hasEntityType\"
#     ]
#   }" \
#    | jq .
  #  | jq '.hits[0].annotations'

  curl -s -k \
  -X POST "$MEILI_SERVER/indexes/$INDEX/search" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary "{
    \"limit\": 5,
    \"filter\": [
      \"eppo0__hasEntityType.1v11 = 'Topic Type > Project'\"
    ],
    \"attributesToRetrieve\": [
      \"eppo0__hasEntityType.1v10\",
      \"eppo0__hasEntityType.1v11\"
    ],
    \"facets\": [\"ds0__source.1v12\"]
  }" \
   | jq .