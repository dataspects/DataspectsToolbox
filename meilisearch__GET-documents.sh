#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

echo "Meili server and index: $DS_MEILI_SERVER and $DS_MEILI_INDEX"

curl --silent --insecure \
  -X GET "$DS_MEILI_SERVER/indexes/$DS_MEILI_INDEX/documents/BtDimGtlwu4o7vuExbplOipv5q3TpHB63e-JBLitpJg" \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
  | jq .