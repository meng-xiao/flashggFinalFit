#!/bin/bash
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background
eval `scramv1 runtime -sh`
$CMSSW_BASE/src/flashggFinalFit/Background/bin/makeBkgPlots -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5,TTHHadronicTag6,TTHHadronicTag7,TTHHadronicTag8,TTHHadronicTag9,TTHHadronicTag10,TTHHadronicTag11 -b CMS-HGG_multipdf_include_bdt_4bins.root -o outdir_include_bdt_4bins/bkgPlots-Data/BkgPlots_cat6.root -d outdir_include_bdt_4bins/bkgPlots-Data -c 6 -l "TTHHadronicTag6" --sqrts 13  --intLumi 41.500000  --doBands --massStep 1.000 --nllTolerance 0.050 -L 100 -H 180 --higgsResolution 1.0 --isMultiPdf --useBinnedData
