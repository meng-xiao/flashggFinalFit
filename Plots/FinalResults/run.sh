#./combineHarvester.py -d muscan.dat -q hepshort.q --batch IC --verbose
#text2workspace.py /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_datacard.txt -o /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_datacardMuScan.root  -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --channel-masks
#text2workspace.py /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_datacard_jhu.txt -o /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_datacardMuScan_jhu.root  -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --channel-masks
##text2workspace.py /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_datacard.txt -o /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_datacardMuScan_off.root  -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --channel-masks
#combine CMS-HGG_mva_13TeV_datacardMuScan_jhu.root  -M MultiDimFit --algo=grid  -P r --points=100  -n MuScanJob0_tag0 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 --squareDistPoi --setParameters mask_TTHHadronicTag1_13TeV=1,mask_TTHHadronicTag2_13TeV=1 #--cminDefaultMinimizerType Minuit2 --cminDefaultMinimizerAlgo migrad 
#combine CMS-HGG_mva_13TeV_datacardMuScan_jhu.root  -M MultiDimFit --algo=grid  -P r --points=100  -n MuScanJob0_tag1 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 --squareDistPoi --setParameters mask_TTHHadronicTag0_13TeV=1,mask_TTHHadronicTag2_13TeV=1 #--cminDefaultMinimizerType Minuit2 --cminDefaultMinimizerAlgo migrad 
#combine CMS-HGG_mva_13TeV_datacardMuScan_jhu.root  -M MultiDimFit --algo=grid  -P r --points=100  -n MuScanJob0_tag2 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 --squareDistPoi --setParameters mask_TTHHadronicTag0_13TeV=1,mask_TTHHadronicTag1_13TeV=1 #--cminDefaultMinimizerType Minuit2 --cminDefaultMinimizerAlgo migrad 
#combine CMS-HGG_mva_13TeV_datacardMuScan_jhu.root  -M MultiDimFit --algo=grid  -P r --points=100  -n MuScanJob0 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 
#
#
#
#text2workspace.py CMS-HGG_mva_13TeV_datacard_jhu_ht.txt -o CMS-HGG_mva_13TeV_datacard_jhu_ht.root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
#combine CMS-HGG_mva_13TeV_datacard_jhu_ht.root -M MultiDimFit --algo=grid  --points=100  -n fcp_scan -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 
#
#text2workspace.py CMS-HGG_mva_13TeV_datacard_jhu_ht_4bins.txt -o CMS-HGG_mva_13TeV_datacard_jhu_ht_4bins.root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
#combine CMS-HGG_mva_13TeV_datacard_jhu_ht_4bins.root -M MultiDimFit --algo=grid  --points=100  -n fcp_scan_4bins -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 

#text2workspace.py CMS-HGG_mva_13TeV_datacard_fullRun2_cp.txt -o CMS-HGG_mva_13TeV_datacard_fullRun2_cp.root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
#combine CMS-HGG_mva_13TeV_datacard_fullRun2_cp.root -M MultiDimFit --algo=grid  --points=100  -n fcp_scan_fullRun2 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 
#combine CMS-HGG_mva_13TeV_datacard_fullRun2_cp.root  -M MultiDimFit --algo=grid  -P r --points=100  -n MuScanFull -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,1.0  -m 125.00 -t -1  --expectSignal 1.00 --setParameters x=0 --freezeParameters x 

#combine CMS-HGG_mva_13TeV_datacard_fullRun2_cp.root -M MultiDimFit --algo=grid  --points=100  -n fcp_scan_fullRun2_stat -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 -S 0 



text2workspace.py CMS-HGG_mva_13TeV_datacard_fullRun2_cp_2cat.txt -o CMS-HGG_mva_13TeV_datacard_fullRun2_cp_2cat.root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
combine CMS-HGG_mva_13TeV_datacard_fullRun2_cp_2cat.root -M MultiDimFit --algo=grid  --points=100  -n fcp_scan_fullRun2_2cat_stat -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setParameterRanges r=0.00,4.0  -m 125.00 -t -1  --expectSignal 1.00 -S 0  --freezeParameters MH 
