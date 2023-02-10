#!/bin/bash

if [[ -z "$DS_MEILI_MASTERKEY" ]]; then
  echo 'You must source a .config file!'
  exit
fi

echo "Meili server and index: $DS_MEILI_SERVER and $DS_MEILI_INDEX"

QUERY='{
  "q": "helpful",
  "attributesToRetrieve": [
    "ds0__source",
    "ds0__specialAspect.1v11"
  ],
  "limit": 1
}'
# QUERY='{
#   "q": "TWebC",
#   "limit": 1,
#   "filter": [
#     "ds0__sourceNamespace=File"
#   ]
# }'
# QUERY='{
#   "q": "mistaken",
#   "attributesToRetrieve": ["eppo0__hasEntityURL"],
#     "filter": "(ds0__source.1v12=\"Source > https://wiki.dataspects.com/wiki/ > Main\" AND ds0__allPredicates.1v11=\"All Predicates > HasEntityType > Feature\") OR (ds0__source.1v11=\"Source > Element\")",
#     "limit": 2
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

URL="$DS_MEILI_SERVER/indexes/$DS_MEILI_INDEX/search"
curl --silent --insecure \
  -X POST $URL \
  -H "Authorization: Bearer $DS_MEILI_MASTERKEY" \
  -H 'Content-Type: application/json' \
  --data-binary "$QUERY" \
   | jq .
   #  | jq '.hits[0].annotations'

echo "Query to '$URL' was:"
echo $QUERY | jq .