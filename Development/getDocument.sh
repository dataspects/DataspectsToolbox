#!/bin/bash

curl -s \
  -X GET "http://localhost:7700/indexes/$INDEX/documents/dscan_144" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  | jq .