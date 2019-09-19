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


### Querying with python and rdflib

To query programmatically one can use:

```python
with open('queries/get_volumes.sparql', 'r') as fp:
    query = fp.read()

from SPARQLWrapper import SPARQLWrapper, JSON
sparql = SPARQLWrapper("http://localhost:8889/bigdata/sparql")
sparql.setQuery(query)
sparql.setReturnFormat(JSON)
results = sparql.query().convert()
print(len(results['results']['bindings']))
```