echo BMB_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/BMB_1
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/BMB_1 -json_map corr_var_to_terms.json  -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/BMB_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/BMB_1
echo BNU_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/BNU_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/BNU_1 -json_map corr_var_to_terms.json  -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/BNU_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r -r /datasets.datalad.org/corr/RawDataBIDS/BNU_1
echo BNU_2
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/BNU_2/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/BNU_2 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/BNU_2/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/BNU_2
echo BNU_3
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/BNU_3/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/BNU_3 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/BNU_3/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/BNU_3
echo DC_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/DC_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/DC_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/DC_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/DC_1
echo HNU_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/HNU_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/HNU_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/HNU_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/HNU_1
echo IACAS
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IACAS/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IACAS -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IACAS/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IACAS
echo IBA_TRT
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IBA_TRT/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IBA_TRT -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IBA_TRT/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IBA_TRT
echo IPCAS_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IPCAS_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IPCAS_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_1
echo IPCAS_2
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_2/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IPCAS_2 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IPCAS_2/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_2
echo IPCAS_3
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_3/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IPCAS_3 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IPCAS_3/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_3
echo IPCAS_4
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_4/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IPCAS_4 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IPCAS_4/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_4
echo IPCAS_5
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_5/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IPCAS_5 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IPCAS_5/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_5
echo IPCAS_6
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_6/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IPCAS_6 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IPCAS_6/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_6
echo IPCAS_7
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_7/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IPCAS_7 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IPCAS_7/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_7
echo IPCAS_8
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_8/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/IPCAS_8 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/IPCAS_8/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/IPCAS_8
echo JHNU
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/JHNU/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/JHNU -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/JHNU/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/JHNU
echo LMU_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/LMU_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/LMU_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/LMU_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/LMU_1
echo LMU_2
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/LMU_2/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/LMU_2 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/LMU_2/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/LMU_2
echo LMU_3
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/LMU_3/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/LMU_3 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/LMU_3/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/LMU_3
echo MPG_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/MPG_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/MPG_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/MPG_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/MPG_1
echo MRN
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/MRN/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/MRN -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/MRN/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/MRN
echo NKI_TRT
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/NKI_TRT/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/NKI_TRT -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/NKI_TRT/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/NKI_TRT
echo NYU_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/NYU_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/NYU_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/NYU_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/NYU_1
echo NYU_2
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/NYU_2/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/NYU_2 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/NYU_2/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/NYU_2
echo SWU_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/SWU_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/SWU_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/SWU_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/SWU_1
echo SWU_2
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/SWU_2/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/SWU_2 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/SWU_2/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/SWU_2
echo SWU_3
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/SWU_3/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/SWU_3 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/SWU_3/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/SWU_3
echo SWU_4
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/SWU_4/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/SWU_4 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/SWU_4/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/SWU_4
echo UM
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/UM/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/UM -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/UM/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/UM
echo UPSM_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/UPSM_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/UPSM_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/UPSM_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/UPSM_1
echo UWM
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/UWM/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/UWM -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/UWM/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/UWM
echo Utah_1
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/Utah_1/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/Utah_1 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/Utah_1/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/Utah_1
echo Utah_2
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/Utah_2/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/Utah_2 -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/Utah_2/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/Utah_2
echo XHCUMS
datalad get -r /datasets.datalad.org/corr/RawDataBIDS/XHCUMS/*
bidsmri2nidm -d /datasets.datalad.org/corr/RawDataBIDS/XHCUMS -json_map corr_var_to_terms.json -o /simple2_NIDM_examples/datasets.datalad.org/corr/RawDataBIDS/XHCUMS/nidm.ttl -log /simple2_NIDM_examples/logs
datalad uninstall -r /datasets.datalad.org/corr/RawDataBIDS/XHCUMS