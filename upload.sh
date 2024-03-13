#!/bin/bash
set -u

for attempt in {1..5}; do
    echo "Uploading #$attempt: $1"
    curl --silent -X POST -H 'Content-Type: text/turtle' --data-binary "@$1"  ${GRAPHDB_API_URL:-http://localhost:8889/bigdata/sparql}
    ex="$?"
    case "$ex" in
        0) break;;
        56) echo "Seems not ready yet, will retry after a sleep";
            sleep 2;;
        *) echo "Exiting with $ex"; exit $ex;;
    esac
done

echo "Finished uploading"
