#!/bin/bash

curl -s \
  -X DELETE "$MEILI_SERVER/indexes/$INDEX/documents" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .