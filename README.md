#simple2_NIDM_examples


### For running queries

1. start blazegraph

 `docker run --name blazegraph -d -p 8889:8080 lyrasis/blazegraph:2.1.5`

2. create upload.sh

```
#!/bin/bash
set -eu
cp $1 test.ttl
curl -X POST -H 'Content-Type: text/turtle' --data-binary '@test.ttl'  http://localhost:8889/bigdata/sparql
```

3. to upload all the turtle files, from the root of this repo do:

```
find $PWD -name "*.ttl" | xargs -I fname bash upload.sh fname
```

4. now go to: `http://localhost:8889/bigdata/#query` and you can paste in the query from the queries folder.