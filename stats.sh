#!/bin/bash

GET="$MEILI_SERVER/indexes/$INDEX/stats"

curl --silent --insecure \
  -X GET $GET \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .

echo "Above you see the stats at $GET"