#simple2_NIDM_examples

### To use blazegraph for running queries and saving to CSV file

1. start blazegraph

 `docker run --name blazegraph --rm -d -p 8889:8080 lyrasis/blazegraph:2.1.5`

2. to upload all the turtle files, from the root of this repo do:

```
find $PWD -name "*.ttl" | xargs -I fname bash upload.sh fname
```

3. open a terminal window

4. run the following curl command.  If you want to run different queries then replace the query after 'query=' in the command below.

curl -X POST http://localhost:8889/bigdata/sparql --data-urlencode 'query=prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> prefix prov: <http://www.w3.org/ns/prov#> prefix ndar: <https://ndar.nih.gov/api/datadictionary/v2/dataelement/> prefix fsl: <http://purl.org/nidash/fsl#> prefix nidm: <http://purl.org/nidash/nidm#> prefix onli: <http://neurolog.unice.fr/ontoneurolog/v3.0/instrument.owl#> prefix freesurfer: <https://surfer.nmr.mgh.harvard.edu/> prefix dx: <http://ncitt.ncit.nih.gov/Diagnosis> prefix ants: <http://stnava.github.io/ANTs/>  prefix dct: <http://purl.org/dc/terms/> prefix dctypes: <http://purl.org/dc/dcmitype/> prefix ncicb: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#> prefix ncit: <http://ncitt.ncit.nih.gov/> prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> prefix uberon: <http://purl.obolibrary.org/obo/UBERON_> prefix xsd: <http://www.w3.org/2001/XMLSchema#> select distinct ?study ?ID ?Age ?dx ?Gender ?FIQ ?PIQ ?VIQ ?tool ?softwareLabel ?federatedLabel ?laterality ?volume where {?measure a/rdfs:subClassOf nidm:DataElement;rdfs:label ?softwareLabel;nidm:measureOf <http://uri.interlex.org/base/ilx_0112559> ;nidm:datumType <http://uri.interlex.org/base/ilx_0738276> . OPTIONAL {?measure nidm:isAbout ?federatedLabel }. OPTIONAL {?measure nidm:hasLaterality ?laterality }. ?tool_entity a prov:Entity;?measure ?volume .?tool_act a prov:Activity ; prov:qualifiedAssociation [prov:agent [nidm:NIDM_0000164 ?tool]] ; prov:qualifiedAssociation [prov:agent [ndar:src_subject_id ?ID]] . ?tool_entity prov:wasGeneratedBy ?tool_act . ?as_activity prov:qualifiedAssociation [prov:agent ?agent] ; dct:isPartOf/dct:isPartOf [dctypes:title ?study] . ?agent ndar:src_subject_id ?ID . {?age_measure a nidm:DataElement ; nidm:isAbout ncicb:Age .} {?sex_measure a nidm:DataElement ; nidm:isAbout ndar:gender .} {?DX_measure a nidm:DataElement ; nidm:isAbout ncit:Diagnosis .} {?FIQ_measure a nidm:DataElement ; nidm:isAbout <https://github.com/dbkeator/nidm-local-terms/issues/2> .} {?PIQ_measure a nidm:DataElement ; nidm:isAbout <https://github.com/dbkeator/nidm-local-terms/issues/4> .} {?VIQ_measure a nidm:DataElement ; nidm:isAbout <https://github.com/dbkeator/nidm-local-terms/issues/3> .} ?as_entity prov:wasGeneratedBy ?as_activity ;?age_measure ?Age;?sex_measure ?GenderCoded ;?FIQ_measure ?FIQ ;?PIQ_measure  ?PIQ ;?VIQ_measure ?VIQ ;?DX_measure ?dx . bind(IF((?GenderCoded ="1" || ?GenderCoded ="Male"^^xsd:string), "Male"^^xsd:string,"Female"^^xsd:string) as ?Gender) .} order by ?study' -H 'Accept:text/csv' > ../queries/simple2_query_output.csv


5. after you are done, you can delete the docker instance by doing

```
docker stop blazegraph
```

this will delete the instance and remove all the data. go back to step 1 to restart.


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


### Simple 2 SPARQL Query (using PyNIDM, running time TOO LONG for > 10 files):
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