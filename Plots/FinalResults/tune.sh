mkdir optimization
for i in {2..5}
do
	cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults
	cp CMS-HGG_mva_13TeV_datacard_TEMPLATE.txt optimization/CMS-HGG_mva_13TeV_datacard_v$i.txt 
	sed -i "s/vVERSION/v$i/g" optimization/CMS-HGG_mva_13TeV_datacard_v$i.txt
	cd optimization
#	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background/CMS-HGG_multipdf_hadronic_bdt_tuneV$i.root CMS-HGG_multipdf_hadronic_bdt_v$i.root
#	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background/CMS-HGG_multipdf_lepronic_bdt_tuneV$i.root CMS-HGG_multipdf_leptonic_bdt_v$i.root
#	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_lepronic_0p_tuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0p_leptonic_sigfit_v$i.root  
#	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_hadronic_0p_tuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0p_hadronic_sigfit_v$i.root  
#	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_lepronic_0m_tuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0m_leptonic_sigfit_v$i.root  
#	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_hadronic_0m_tuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0m_hadronic_sigfit_v$i.root  
	text2workspace.py CMS-HGG_mva_13TeV_datacard_v$i.txt -o CMS-HGG_mva_13TeV_datacard_v$i.root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
	combine CMS-HGG_mva_13TeV_datacard_v$i.root -M MultiDimFit --algo=grid  --points=50  -n version$i --setParameterRanges r=0.00,4.0 -m 125.00 -t -1  --expectSignal 1.00 -S 0 --freezeParameters MH 
done
