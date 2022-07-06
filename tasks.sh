#!/bin/bash

curl -s \
  -X GET "$MEILI_SERVER/tasks" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .