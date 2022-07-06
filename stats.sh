#!/bin/bash

curl -s \
  -X GET "$MEILI_SERVER/indexes/$INDEX/stats" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .