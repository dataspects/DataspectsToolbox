#!/bin/bash

curl -s \
  -X GET 'http://localhost:7700/keys' \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .