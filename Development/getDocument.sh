#!/bin/bash

curl -s \
  -X GET "$MEILI_SERVER/indexes/$INDEX/documents/dscan_144" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  | jq .