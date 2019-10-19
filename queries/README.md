# To use Keator's Awesome SPARQL query on all NIDM ttl files:

1. install PyNIDM: https://github.com/INCF-NIDASH/PyNIDM
2. git clone simple 2 repo: git clone https://github.com/dbkeator/simple2_NIDM_examples.git
3. Open terminal window
4. cd to ~/..../simple2_NIDM_examples/datasets.datalad.org
5. pynidm query -nl "$(echo $(cat nidm_list.txt) | tr " " "," )" -q ../queries/get_volumes_KeatorsAwesomeQuery.sparql -o ~/Downloads/get_volumes_KeatorsAwesomeQueryOutput.csv

