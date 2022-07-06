#!/bin/bash

curl -s \
  -X DELETE "http://localhost:7700/indexes/$INDEX/documents" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .