#!/bin/bash
cur=$PWD
mkdir optimization
for i in {1..6}
do
	cd optimization
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background/CMS-HGG_multipdf_hadronic_bdt_SMtuneV$i.root CMS-HGG_multipdf_hadronic_bdt_v"$i"_sm.root
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background/CMS-HGG_multipdf_lepronic_bdt_SMtuneV$i.root CMS-HGG_multipdf_leptonic_bdt_v"$i"_sm.root
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_lepronic_0p_SMtuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0p_leptonic_sigfit_v"$i"_sm.root  
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_hadronic_0p_SMtuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0p_hadronic_sigfit_v"$i"_sm.root  
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_lepronic_0m_SMtuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0m_leptonic_sigfit_v"$i"_sm.root  
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_hadronic_0m_SMtuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0m_hadronic_sigfit_v"$i"_sm.root  
	cd $cur
	for j in leptonic hadronic
	do
		cd optimization
		combineCards.py CMS-HGG_mva_13TeV_datacard_"$j"_cat*_v"$i"_sm.txt > CMS-HGG_mva_13TeV_datacard_"$j"_v"$i"_sm.txt
			text2workspace.py CMS-HGG_mva_13TeV_datacard_"$j"_v"$i"_sm.txt -o CMS-HGG_mva_13TeV_"$j"_v"$i"_sm.root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
			combine CMS-HGG_mva_13TeV_"$j"_v"$i"_sm.root -M MultiDimFit --algo=grid  --points=50  -n "$j"_v"$i"_sm --setParameterRanges r=0.00,4.0 -m 125.00 -t -1  --expectSignal 1.00 -S 0 --freezeParameters MH 
	#	for k in {1..2}
	#	do
	#		#cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults
	#		cd $cur
	#		cp CMS-HGG_mva_13TeV_datacard_TEMPLATE_percat.txt optimization/CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i"_sm.txt 
	#		filename=optimization/CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i"_sm.txt
	#		t1=$(((k-1)*2))
	#		t2=$(((k-1)*2+1))
	#		echo $t1 $t2
	#		tagpre="TTHHadronicTag"
	#		if [ $j = "leptonic" ] 
	#		then
	#			tagpre="TTHLeptonicTag"
	#		fi
	#		sed -i "s/vVERSION/v"$i"_sm/g" $filename 
	#		sed -i "s/TAG1/$tagpre$t1/g" $filename 
	#		sed -i "s/TAG2/$tagpre$t2/g" $filename 
	#		sed -i "s/CHAN/$j/g" $filename 
	#		cd optimization
	#		text2workspace.py CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i"_sm.txt -o CMS-HGG_mva_13TeV_"$j"_cat"$k"_v"$i"_sm.root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
	#		combine CMS-HGG_mva_13TeV_"$j"_cat"$k"_v"$i"_sm.root -M MultiDimFit --algo=grid  --points=50  -n "$j"_cat"$k"_v"$i"_sm --setParameterRanges r=0.00,4.0 -m 125.00 -t -1  --expectSignal 1.00 -S 0 --freezeParameters MH 
	#	done
	done
done
