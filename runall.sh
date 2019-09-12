for i in {0..4}
do 
	j_had=$(echo "-0.2+$i*0.1" |bc)
	j_lep=$(echo "-0.1+$i*0.05" |bc)
	v=$((i+1))
	echo $j_had $j_lep $v
#background model preparation
#./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/data_all_had_bdt.root -p bkg -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext hadronic_bdt_tuneV$v --intLumi 41.5 --backgroundOnly --isData --batch none --dataFile /eos/home-x/xiaomeng/ttH/data_all_had_bdt.root --boundaries 0.9675,0.9937,0.9971,1 --bdt_boundary $j_had  
#./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/data_all_lep_bdt.root -p bkg -f TTHLeptonicTag0,TTHLeptonicTag1,TTHLeptonicTag2,TTHLeptonicTag3,TTHLeptonicTag4,TTHLeptonicTag5 --ext lepronic_bdt_tuneV$v --intLumi 41.5 --backgroundOnly --isData --batch none --dataFile /eos/home-x/xiaomeng/ttH/data_all_lep_bdt.root --boundaries 0.8435,0.9346,0.9625,1 --bdt_boundary $j_lep  
#signal model preparation
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0M_had_new_2018_bdt.root -p tth_ALT -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext hadronic_0m_tuneV$v --intLumi 41.5 --signalOnly --batch none  --boundaries 0.9675,0.9937,0.9971,1 --bdt_boundary $j_had 
#./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0M_lep_new_2018_bdt.root -p tth_ALT -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext lepronic_0m_tuneV$v --intLumi 41.5 --signalOnly --batch none  --boundaries 0.8435,0.9346,0.9625,1 --bdt_boundary $j_lep 
#./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0PM_had_new_2018_bdt.root -p tth -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext hadronic_0p_tuneV$v --intLumi 41.5 --signalOnly --batch none  --boundaries 0.9675,0.9937,0.9971,1 --bdt_boundary $j_had 
#./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0PM_lep_new_2018_bdt.root -p tth -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext lepronic_0p_tuneV$v --intLumi 41.5 --signalOnly --batch none  --boundaries 0.8435,0.9346,0.9625,1 --bdt_boundary $j_lep 
done






#datacard generation
#./runFinalFitsScripts.sh -i <comma separated list of signal files>125 -p <comma separated list of processes> -f <comma separated list of catgeories/tags> --ext <file extension/name to identify this iteration>  --intLumi <specified in fb^{-1}> --datacardOnly --dataFile <data file> --isData --batch <batch system: LSF (Cern) or IC>
#running combine and the final results
#./runFinalFitsScripts.sh -i <comma separated list of signal files> -p <comma separated list of processes> -f <comma separated list of catgeories/tags> --ext <file extension/name to identify this iteration>  --intLumi <specified in fb^{-1}> --combineOnly --dataFile <data file> --isData --batch <batch system: LSF (Cern) or IC>

