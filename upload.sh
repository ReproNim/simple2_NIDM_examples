#!/bin/bash
set -eu

if test -f "test.ttl"; then
    rm test.ttl
fi
cp $1 test.ttl
echo "uploading: $1"
curl -X POST -H 'Content-Type: text/turtle' --data-binary '@test.ttl'  http://localhost:8889/bigdata/sparql
echo "Finished uploading"
