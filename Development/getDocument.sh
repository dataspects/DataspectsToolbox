#!/bin/bash

echo "Meili server and index: $MEILI_SERVER and $INDEX"

curl --silent --insecure \
  -X GET "$MEILI_SERVER/indexes/$INDEX/documents/BtDimGtlwu4o7vuExbplOipv5q3TpHB63e-JBLitpJg" \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  | jq .