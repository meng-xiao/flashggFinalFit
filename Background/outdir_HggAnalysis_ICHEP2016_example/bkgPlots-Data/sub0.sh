#!/bin/bash
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background
eval `scramv1 runtime -sh`
$CMSSW_BASE/src/flashggFinalFit/Background/bin/makeBkgPlots -f TTHHadronicTag -b CMS-HGG_multipdf_HggAnalysis_ICHEP2016_example.root -o outdir_HggAnalysis_ICHEP2016_example/bkgPlots-Data/BkgPlots_cat0.root -d outdir_HggAnalysis_ICHEP2016_example/bkgPlots-Data -c 0 -l "TTHHadronicTag" --sqrts 13  --intLumi 40.500000  --doBands --massStep 1.000 --nllTolerance 0.050 -L 100 -H 180 --higgsResolution 1.0 --isMultiPdf --useBinnedData
