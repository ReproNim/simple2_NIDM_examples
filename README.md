#simple2_NIDM_examples

### Simple 2 SPARQL Query (using PyNIDM, running time ~6 min):
This query will return study name, participant ID, age, diagnosis, gender, FIQ, PIQ, VIQ, and brain volume data.  It depends on NIDM files that include all of this information. The examples from ABIDE and ADHD200 have been converted to NIDM in 3 steps: (1) BIDS2MRI to get metadata about project information; (2) CSV2NIDM to convert/annotate assessment and demographics information (i.e. age, gender, diagnosis, FIQ, ...) (3) Exported brain volume data from ANTS, FSL, and Freesurfer using https://github.com/dbkeator/ants_seg_to_nidm, https://github.com/dbkeator/fsl_seg_to_nidm, and https://github.com/dbkeator/segstats_jsonld/ respectively.  The simple_2_NIDM_examples repo has some helper scripts for the brain volume stuff on a large scale (see add_freesurfer_asegvols.py, add_fsl_segvols.py, and add_fsl_segvols.py).

1. install PyNIDM: https://github.com/INCF-NIDASH/PyNIDM
2. git clone simple 2 repo: git clone https://github.com/dbkeator/simple2_NIDM_examples.git
3. Open terminal window
4. cd to ~/..../simple2_NIDM_examples/datasets.datalad.org
5. pynidm query -nl "$(echo $(cat nidm_list.txt) | tr " " "," )" -q ../queries/simple2_query.sparql -o ~/Downloads/simple2_query_output.csv


### Brain Volumes ONLY SPARQL Query:
If you have NIDM files that contain ONLY brain volume data (i.e. you didn't using bidsmri2nidm nor csv2nidm and only used  https://github.com/dbkeator/ants_seg_to_nidm, https://github.com/dbkeator/fsl_seg_to_nidm, and https://github.com/dbkeator/segstats_jsonld/ to extract brain volume data.  See corr study in this repo for example) then you should use the query ../queries/get_volumes_NoExpData.spaqrl.  Note the example below queries across ABIDE, ADHD200, and CoRR studies for the moment. 

1. install PyNIDM: https://github.com/INCF-NIDASH/PyNIDM
2. git clone simple 2 repo: git clone https://github.com/dbkeator/simple2_NIDM_examples.git
3. Open terminal window
4. cd to ~/..../simple2_NIDM_examples/datasets.datalad.org
5. pynidm query -nl "$(echo $(cat nidm_list_with_corr.txt) | tr " " "," )" -q ../queries/get_volumes_NoExpData.sparql -o ~/Downloads/get_volumes_output.csv


### To use blazegraph for running queries

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
import rdflib as rl
with open('queries/get_volumes.sparql', 'r') as fp:
    query = fp.read()

from SPARQLWrapper import SPARQLWrapper, JSON
sparql = SPARQLWrapper("http://localhost:8889/bigdata/sparql")
sparql.setQuery(query)
sparql.setReturnFormat(JSON)
results = sparql.query().convert()
```