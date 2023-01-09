#!/bin/bash

echo "Meili server and index: $MEILI_SERVER and $INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

DELETE="$MEILI_SERVER/tasks?statuses=enqueued,processing,failed"

curl --insecure \
  -X DELETE $DELETE \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
   | jq .

echo "Above you see the response to command $DELETE"
