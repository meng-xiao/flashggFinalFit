#!/bin/bash
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background
eval `scramv1 runtime -sh`
$CMSSW_BASE/src/flashggFinalFit/Background/bin/makeBkgPlots -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5,TTHHadronicTag6,TTHHadronicTag7,--ext -b CMS-HGG_multipdf_auto.root -o outdir_auto/bkgPlots-Data/BkgPlots_cat1.root -d outdir_auto/bkgPlots-Data -c 1 -l "TTHHadronicTag1" --sqrts 13  --intLumi 137.100000  --doBands --massStep 1.000 --nllTolerance 0.050 -L 100 -H 180 --higgsResolution 1.0 --isMultiPdf --useBinnedData
