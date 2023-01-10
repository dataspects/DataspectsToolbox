#!/bin/bash

TERM="Canasta"
echo "Meili server and index: $MEILI_SERVER and $INDEX"

QUERY='{
  "q": "Cargo"
}'
# QUERY='{
#   "q": "affiliated",
#   "filter": [
#     "eppo0__hasEntityType="Aspect""
#   ]
# }'
# QUERY='{
#   "q": "TERM",
#   "limit": 4,
#   "filter": "release_timestamp >= 1514761200",
#   "attributesToRetrieve": [
#       "eppo0__hasEntityType"
#     ]
# }'
# QUERY='{
#     "limit": 5,
#     "filter": [
#       "eppo0__hasEntityType.1v11 = \"Topic Type > Project\""
#     ],
#     "attributesToRetrieve": [
#       "eppo0__hasEntityType.1v10",
#       "eppo0__hasEntityType.1v11"
#     ],
#     "facets": ["ds0__source.1v12"]
# }'

URL="$MEILI_SERVER/indexes/$INDEX/search"
curl --silent --insecure \
  -X POST $URL \
  -H "Authorization: Bearer $MEILI_MASTER_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary "$QUERY" \
   | jq .
   #  | jq '.hits[0].annotations'

echo "Query to '$URL' was:"
echo $QUERY | jq .