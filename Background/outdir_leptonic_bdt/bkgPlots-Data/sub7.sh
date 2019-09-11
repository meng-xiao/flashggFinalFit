#!/bin/bash
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background
eval `scramv1 runtime -sh`
$CMSSW_BASE/src/flashggFinalFit/Background/bin/makeBkgPlots -f TTHLeptonicTag0,TTHLeptonicTag1,TTHLeptonicTag2,TTHLeptonicTag3,TTHLeptonicTag4,TTHLeptonicTag5,TTHLeptonicTag6,TTHLeptonicTag7 -b CMS-HGG_multipdf_leptonic_bdt.root -o outdir_leptonic_bdt/bkgPlots-Data/BkgPlots_cat7.root -d outdir_leptonic_bdt/bkgPlots-Data -c 7 -l "TTHLeptonicTag7" --sqrts 13  --intLumi 137.100000  --doBands --massStep 1.000 --nllTolerance 0.050 -L 100 -H 180 --higgsResolution 1.0 --isMultiPdf --useBinnedData
