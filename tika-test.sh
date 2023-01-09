#!/bin/bash

# https://docs.meilisearch.com/learn/advanced/asynchronous_operations.html#filtering-tasks
# enqueued, processing, succeeded, failed

URL="http://localhost:9998/rmeta"

curl --silent --insecure \
  -X PUT $URL \
  -H "Content-type: image/png" \
  --data-binary @./TWebC.png \
  | jq .


echo "Above you see the response to command $URL"
