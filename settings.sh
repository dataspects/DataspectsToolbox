#!/bin/bash

curl -s \
  -X GET "$MEILI_SERVER/settings" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .