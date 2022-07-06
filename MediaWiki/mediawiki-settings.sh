#!/bin/bash

curl -s \
  -X GET "http://localhost:7700/indexes/$INDEX/settings" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .