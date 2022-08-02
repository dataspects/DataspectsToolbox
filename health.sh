#!/bin/bash

curl -s \
  -X GET "$MEILI_SERVER/health" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .