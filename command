#./runFinalFitsScripts.sh -i ttHiggs0PMToGG_M125_13TeV_JHUGenV7011_pythia8.root,ttHOutput_125/output_GluGluHToGG_M125_13TeV_powheg_pythia8.root,ttHOutput_125/output_VBFHToGG_M125_13TeV_powheg_pythia8.root,ttHOutput_125/output_WZHToGG_M125_13TeV_amcatnloFXFX_madspin_pythia8.root,ttHOutput_125/output_THQ_ctcvcp_HToGG_M125_13TeV-madgraph-pythia8_TuneCP5.root,ttHOutput_125/output_THW_ctcvcp_HToGG_M125_13TeV-madgraph-pythia8_TuneCP5.root -p TTH,GG2H,VBF,QQ2HLL,testTHQ,testTHW -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2 --ext test_example --intLumi 41.5 --datacardOnly --dataFile $eosdir/lxplusBackUp/ttH/data.root --isData 1 --massList 125 --doSTXS True 

#./runFinalFitsScripts.sh -i ttHiggs0PMToGG_M125_13TeV_JHUGenV7011_pythia8.root,ttHOutput_125/output_GluGluHToGG_M125_13TeV_powheg_pythia8.root,ttHOutput_125/output_VBFHToGG_M125_13TeV_powheg_pythia8.root,ttHOutput_125/output_WZHToGG_M125_13TeV_amcatnloFXFX_madspin_pythia8.root,ttHOutput_125/output_THQ_ctcvcp_HToGG_M125_13TeV-madgraph-pythia8_TuneCP5.root,ttHOutput_125/output_THW_ctcvcp_HToGG_M125_13TeV-madgraph-pythia8_TuneCP5.root -p TTH,GG2H,VBF,QQ2HLL,testTHQ,testTHW -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2 --ext test_example --intLumi 41.5 --signalOnly --dataFile $eosdir/lxplusBackUp/ttH/data.root --isData 1 --massList 125 --doSTXS True 
#
#./runFinalFitsScripts.sh -i $eosdir/lxplusBackUp/ttH/ttHiggs0PMToGG_M125_13TeV_JHUGenV7011_pythia8.root -p tth -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2 --ext test_example  --intLumi 41.5 --datacardOnly --dataFile $eosdir/lxplusBackUp/ttH/data.root --isData 
#./runFinalFitsScripts.sh -i $eosdir/lxplusBackUp/ttH/ttHiggs0PMToGG_M125_13TeV_JHUGenV7011_pythia8.root -p tth -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2 --ext test_example  --intLumi 41.5 --combineOnly --dataFile $eosdir/lxplusBackUp/ttH/data.root --isData 
#

#ttHOutput_125/output_bbHToGG_M-125_4FS_yb2_13TeV_amcatnlo.root,

#--batch <batch system: LSF (Cern) or IC>

#condor_submit condor.submit.SM
#condor_submit condor.submit
condor_submit condor.submit.BDT -dry-run > try.log
