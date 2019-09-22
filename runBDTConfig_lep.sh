#!/bin/bash
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit
eval `scramv1 runtime -sh`
#background model preparation
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/data_all_lep_bdt.root -p bkg -f TTHLeptonicTag0,TTHLeptonicTag1,TTHLeptonicTag2,TTHLeptonicTag3,TTHLeptonicTag4,TTHLeptonicTag5 --ext lepronic_bdt_BDT3binTuneV$3 --intLumi 41.5 --backgroundOnly --isData --batch none --dataFile /eos/home-x/xiaomeng/ttH/data_all_lep_bdt.root --boundaries 0.8435,0.9532,1 --bdt_boundary $1,$2 
#signal model preparation
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0M_lep_new_2018_bdt.root -p tth_ALT -f TTHLeptonicTag0,TTHLeptonicTag1,TTHLeptonicTag2,TTHLeptonicTag3,TTHLeptonicTag4,TTHLeptonicTag5 --ext lepronic_0m_BDT3binTuneV$3 --intLumi 41.5 --signalOnly --batch none  --boundaries 0.8435,0.9532,1 --bdt_boundary $1,$2 
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0PM_lep_new_2018_bdt.root -p tth -f TTHLeptonicTag0,TTHLeptonicTag1,TTHLeptonicTag2,TTHLeptonicTag3,TTHLeptonicTag4,TTHLeptonicTag5 --ext lepronic_0p_BDT3binTuneV$3 --intLumi 41.5 --signalOnly --batch none  --boundaries 0.8435,0.9532,1 --bdt_boundary $1,$2
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0M_lep_new_2018_bdt.root -p tth_ALT -f TTHLeptonicTag0,TTHLeptonicTag1,TTHLeptonicTag2,TTHLeptonicTag3,TTHLeptonicTag4,TTHLeptonicTag5 --ext lepronic_0m_BDT3binTuneV$3 --intLumi 41.5 --signalOnly --batch none  --boundaries 0.8435,0.9532,1 --bdt_boundary $1,$2 
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0PM_lep_new_2018_bdt.root -p tth -f TTHLeptonicTag0,TTHLeptonicTag1,TTHLeptonicTag2,TTHLeptonicTag3,TTHLeptonicTag4,TTHLeptonicTag5 --ext lepronic_0p_BDT3binTuneV$3 --intLumi 41.5 --signalOnly --batch none  --boundaries 0.8435,0.9532,1 --bdt_boundary $1,$2
