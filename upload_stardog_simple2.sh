#!/bin/bash
set -eu

if test -f "test.ttl"; then
    rm test.ttl
fi
cp $1 test.ttl
echo "uploading: $1"

#curl -X POST -H 'Content-Type: application/x-turtle' -T 'test.ttl' --user nidm:wexta6-jupnak-Civbuj http://nidm.scicrunch.io:7200/repositories/simple2/statements 


tx=`curl -u keator:qBfcCAds7weVd6xaL5cC2hwJaoyX4f -X POST https://search.dandiarchive.org:5820/simple2/transaction/begin`

curl -u keator:qBfcCAds7weVd6xaL5cC2hwJaoyX4f -X POST "https://search.dandiarchive.org:5820/simple2/${tx}/add?graph-uri=default" \
-H "Content-Type: text/turtle" \
--data-binary @test.ttl

curl -u keator:qBfcCAds7weVd6xaL5cC2hwJaoyX4f -X POST "https://search.dandiarchive.org:5820/simple2/transaction/commit/${tx}"


echo "Finished uploading"
