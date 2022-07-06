#!/bin/bash

curl -s \
  -X GET "$MEILI_SERVER/indexes/$INDEX/settings" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .