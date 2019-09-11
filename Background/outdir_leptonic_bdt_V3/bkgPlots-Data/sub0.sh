#!/bin/bash
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background
eval `scramv1 runtime -sh`
$CMSSW_BASE/src/flashggFinalFit/Background/bin/makeBkgPlots -f TTHLeptonicTag0,TTHLeptonicTag1 -b CMS-HGG_multipdf_leptonic_bdt_V3.root -o outdir_leptonic_bdt_V3/bkgPlots-Data/BkgPlots_cat0.root -d outdir_leptonic_bdt_V3/bkgPlots-Data -c 0 -l "TTHLeptonicTag0" --sqrts 13  --intLumi 41.500000  --doBands --massStep 1.000 --nllTolerance 0.050 -L 100 -H 180 --higgsResolution 1.0 --isMultiPdf --useBinnedData
