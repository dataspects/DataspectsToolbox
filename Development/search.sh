#!/bin/bash

TERM="'repository'"
echo "Meili server and index: $MEILI_SERVER and $INDEX: searching for $TERM"

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
  --data-binary "{ \"q\": \"$TERM\" }" \
   | jq .
  #  | jq '.hits[0].annotations'