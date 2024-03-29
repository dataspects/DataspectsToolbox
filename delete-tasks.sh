#!/bin/bash

echo "Meili server and index: $DS_MEILI_SERVER and $DS_MEILI_INDEX"
read -p "Continue? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit
fi

DELETE="$DS_MEILI_SERVER/tasks?statuses=enqueued,processing,failed"

curl --insecure \
  -X DELETE $DELETE \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
   | jq .

echo "Above you see the response to command $DELETE"
