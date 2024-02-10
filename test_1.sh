#!/bin/bash

set -eu
set -o pipefail


# 2. to upload all the turtle files, from the root of this repo do:
#    Using GNU parallel to expedite it a little
find "$PWD" -name "*.ttl" \
    | parallel --halt now,fail=1 --jobs 4 --cf --bar './upload.sh {}'

# Serial way
# We need to trick xargs to exit as soon as first command to fail.
#    | xargs '-I{}' sh -c './upload.sh '{}' || exit 255'

# 3,4. Run the query
output=queries/simple2_query_output.csv
/usr/bin/time curl --silent -X POST "${GRAPHDB_API_URL}" --data-binary '@queries/simple2_query.sparql' -H 'Accept: text/csv' -H "Content-Type: application/sparql-query" >| "$output"

# introspect differences
if git diff "$output" | grep -q .; then
    echo "FAIL: there were differences in $output"
    exit 1
fi
    

