#!/bin/bash

# https://docs.meilisearch.com/learn/advanced/asynchronous_operations.html#filtering-tasks
# enqueued, processing, succeeded, failed

curl --silent --insecure \
  -X GET "$MEILI_SERVER/version" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .