#!/bin/bash

set -eu
set -o pipefail

### To use blazegraph for running queries and saving to CSV file

# 1. start blazegraph and configure it to be stopped when we exit from the script

docker run --name blazegraph --rm -d -p 8889:8080 islandora/blazegraph:3.1.1

trap "docker stop blazegraph" SIGINT SIGHUP SIGABRT EXIT

echo "Waiting for blazegraph to start"
while ! curl --silent 'http://localhost:8889/bigdata/' | grep 'Input a SPARQL query'; do
    :
done

sleep 2;  # sleep a little more for server to come up, no other means so far were sufficient


# 2. to upload all the turtle files, from the root of this repo do:
# We need to trick xargs to exit as soon as first command to fail.
find "$PWD" -name "*.ttl" \
    | xargs '-I{}' sh -c './upload.sh '{}' || exit 255'

# 3,4. Run the query

curl -X POST http://localhost:8889/bigdata/sparql --data-binary '@queries/simple2_query.sparql' -H "Content-Type: application/sparql-query" >| queries/simple2_query_output.csv

# introspect differences
git diff 

