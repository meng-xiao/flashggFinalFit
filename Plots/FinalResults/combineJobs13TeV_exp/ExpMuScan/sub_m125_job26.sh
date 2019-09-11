#!/bin/bash
touch /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/combineJobs13TeV_exp/ExpMuScan/sub_m125_job26.sh.run
cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults
eval `scramv1 runtime -sh`
cd $TMPDIR
number=$RANDOM
mkdir -p scratch_$number
cd scratch_$number
cp -p $CMSSW_BASE/bin/$SCRAM_ARCH/combine .
cp -p /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_datacardMuScan.root .
cp -p /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_sigfit.root .
cp -p /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/CMS-HGG_mva_13TeV_multipdf.root .
if ( combine CMS-HGG_mva_13TeV_datacardMuScan.root  -M MultiDimFit --cminDefaultMinimizerType Minuit2 --cminDefaultMinimizerAlgo migrad --algo=grid  -P r --points=400 --firstPoint=260 --lastPoint=269 -n MuScanJob26 -L $CMSSW_BASE/lib/$SCRAM_ARCH/libHiggsAnalysisGBRLikelihood.so --setPhysicsModelParameterRanges r=0.00,5.00  -m 125.00 -t -1  --expectSignal 1.00 --squareDistPoi ) then
	 mv higgsCombine*.root /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/combineJobs13TeV_exp/ExpMuScan
	 touch /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/combineJobs13TeV_exp/ExpMuScan/sub_m125_job26.sh.done
else
	 touch /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/combineJobs13TeV_exp/ExpMuScan/sub_m125_job26.sh.fail
fi
rm -f /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults/combineJobs13TeV_exp/ExpMuScan/sub_m125_job26.sh.run
cd -
rm -rf scratch_$number
