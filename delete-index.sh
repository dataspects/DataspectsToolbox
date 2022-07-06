#!/bin/bash

curl -s \
  -X DELETE "$MEILI_SERVER/indexes/$INDEX" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .