#!/bin/bash

# https://docs.meilisearch.com/learn/advanced/asynchronous_operations.html#filtering-tasks
# enqueued, processing, succeeded, failed

GET="$MEILI_SERVER/tasks?statuses=enqueued,processing,failed"

curl --silent --insecure \
  -X GET $GET \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .

echo "Above you see the response to command $GET"
