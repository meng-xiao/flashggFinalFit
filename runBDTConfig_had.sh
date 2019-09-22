#!/bin/bash
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit
eval `scramv1 runtime -sh`
#background model preparation
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/data_all_had_bdt.root -p bkg -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext hadronic_bdt_BDT3binTuneV$3 --intLumi 41.5 --backgroundOnly --isData --batch none --dataFile /eos/home-x/xiaomeng/ttH/data_all_had_bdt.root --boundaries 0.9675,0.9917,1 --bdt_boundary $1,$2 
#signal model preparation
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0M_had_new_2018_bdt.root -p tth_ALT -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext hadronic_0m_BDT3binTuneV$3 --intLumi 41.5 --signalOnly --batch none  --boundaries 0.9675,0.9917,1 --bdt_boundary $1,$2 
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0PM_had_new_2018_bdt.root -p tth -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext hadronic_0p_BDT3binTuneV$3 --intLumi 41.5 --signalOnly --batch none  --boundaries 0.9675,0.9917,1 --bdt_boundary $1,$2
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0M_had_new_2018_bdt.root -p tth_ALT -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext hadronic_0m_BDT3binTuneV$3 --intLumi 41.5 --signalOnly --batch none  --boundaries 0.9675,0.9917,1 --bdt_boundary $1,$2
./runFinalFitsScripts.sh -i /eos/home-x/xiaomeng/ttH/ttHgg_0PM_had_new_2018_bdt.root -p tth -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 --ext hadronic_0p_BDT3binTuneV$3 --intLumi 41.5 --signalOnly --batch none  --boundaries 0.9675,0.9917,1 --bdt_boundary $1,$2
