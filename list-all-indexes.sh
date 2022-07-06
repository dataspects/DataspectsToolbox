#!/bin/bash

curl -s \
  -X GET "$MEILI_SERVER/indexes" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .