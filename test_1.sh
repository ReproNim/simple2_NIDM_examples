#!/bin/bash

set -eu
set -o pipefail


# 2. to upload all the turtle files, from the root of this repo do:
# We need to trick xargs to exit as soon as first command to fail.
find "$PWD" -name "*.ttl" \
    | xargs '-I{}' sh -c './upload.sh '{}' || exit 255'

# 3,4. Run the query

curl -X POST "${GRAPHDB_API_URL}" --data-binary '@queries/simple2_query.sparql' -H "Content-Type: application/sparql-query" >| queries/simple2_query_output.csv

# introspect differences
git diff 

