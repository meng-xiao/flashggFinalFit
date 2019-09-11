#!/bin/bash
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background
eval `scramv1 runtime -sh`
$CMSSW_BASE/src/flashggFinalFit/Background/bin/makeBkgPlots -f TTHHadronicTag0,TTHHadronicTag1,TTHHadronicTag2,TTHHadronicTag3,TTHHadronicTag4,TTHHadronicTag5 -b CMS-HGG_multipdf_hadronic_bdt_tuneV1.root -o outdir_hadronic_bdt_tuneV1/bkgPlots-Data/BkgPlots_cat0.root -d outdir_hadronic_bdt_tuneV1/bkgPlots-Data -c 0 -l "TTHHadronicTag0" --sqrts 13  --intLumi 41.500000  --doBands --massStep 1.000 --nllTolerance 0.050 -L 100 -H 180 --higgsResolution 1.0 -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_hadronic_bdt_tuneV1/CMS-HGG_sigfit_hadronic_bdt_tuneV1.root --isMultiPdf --useBinnedData
