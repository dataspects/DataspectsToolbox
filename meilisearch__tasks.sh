#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

# https://docs.meilisearch.com/learn/advanced/asynchronous_operations.html#filtering-tasks
# enqueued, processing, succeeded, failed

GET="$DS_MEILI_SERVER/tasks?statuses=enqueued,processing,failed"

curl --silent --insecure \
  -X GET $GET \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
   | jq .

echo "Above you see the response to command $GET"