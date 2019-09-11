#signal model preparation
#./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0M_had_2018_bdt.root -p tth_ALT -f TTHHadronicTag0,TTHHadronicTag1 --ext jhu_0m_tuneV1 --intLumi 41.5 --signalOnly --batch none 
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0M_had_2018_bdt.root -p tth_ALT -f TTHHadronicTag0,TTHHadronicTag1 --ext jhu_0m_tuneV1 --intLumi 41.5 --signalOnly --batch none --boundaries "0.9675,1" --bdt_boundary 0 
#background model preparation
#./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/data_all_had_bdt.root -p bkg -f TTHHadronicTag0,TTHHadronicTag1 --ext hadronic_bdt_tuneV1 --intLumi 41.5 --backgroundOnly --isData --batch none --dataFile /eos/home-x/xiaomeng/ttH/data_all_had_bdt.root 
#datacard generation
#./runFinalFitsScripts.sh -i <comma separated list of signal files>125 -p <comma separated list of processes> -f <comma separated list of catgeories/tags> --ext <file extension/name to identify this iteration>  --intLumi <specified in fb^{-1}> --datacardOnly --dataFile <data file> --isData --batch <batch system: LSF (Cern) or IC>
#running combine and the final results
#./runFinalFitsScripts.sh -i <comma separated list of signal files> -p <comma separated list of processes> -f <comma separated list of catgeories/tags> --ext <file extension/name to identify this iteration>  --intLumi <specified in fb^{-1}> --combineOnly --dataFile <data file> --isData --batch <batch system: LSF (Cern) or IC>

