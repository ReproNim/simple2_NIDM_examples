#!/bin/bash
set -eu

if test -f "test.ttl"; then
    rm test.ttl
fi
cp $1 test.ttl
echo "uploading: $1"
curl -X POST -H 'Content-Type: application/x-turtle' -T 'test.ttl' --user nidm:wexta6-jupnak-Civbuj http://nidm.scicrunch.io:7200/repositories/simple2/statements 
echo "Finished uploading"
