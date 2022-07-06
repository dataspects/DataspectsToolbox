#!/bin/bash

curl -s \
  -X POST "$MEILI_SERVER/indexes/$INDEX/search" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary '{ "q": "encompasses", "filter": [
        "eppo0__hasEntityType=\"Aspect\""
    ] }' \
   | jq .