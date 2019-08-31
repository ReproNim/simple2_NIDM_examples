#simple2_NIDM_examples


### For running queries

1. start blazegraph

 `docker run --name blazegraph --rm -d -p 8889:8080 lyrasis/blazegraph:2.1.5`

2. to upload all the turtle files, from the root of this repo do:

```
find $PWD -name "*.ttl" | xargs -I fname bash upload.sh fname
```

3. now go to: `http://localhost:8889/bigdata/#query` and you can paste in the query from the queries folder.

4. after you are done, you can delete the docker instance by doing

```
docker stop blazegraph
```

this will delete the instance and remove all the data. go back to step 1 to restart.