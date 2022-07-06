#!/bin/bash

curl -s \
  -X GET 'http://localhost:7700/tasks' \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .