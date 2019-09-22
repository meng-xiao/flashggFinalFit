#!/bin/bash
cur=$PWD
mkdir optimization
for i in {1..36}
do
	cd optimization
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background/CMS-HGG_multipdf_hadronic_bdt_BDT3binTuneV$i.root CMS-HGG_multipdf_hadronic_bdt_v"$i"_bdt.root
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Background/CMS-HGG_multipdf_lepronic_bdt_BDT3binTuneV$i.root CMS-HGG_multipdf_leptonic_bdt_v"$i"_bdt.root
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_lepronic_0p_BDT3binTuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0p_leptonic_sigfit_v"$i"_bdt.root  
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_hadronic_0p_BDT3binTuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0p_hadronic_sigfit_v"$i"_bdt.root  
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_lepronic_0m_BDT3binTuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0m_leptonic_sigfit_v"$i"_bdt.root  
	ln -s /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Signal/outdir_hadronic_0m_BDT3binTuneV$i/CMS-HGG_mva_13TeV_sigfit.root CMS-HGG_mva_13TeV_0m_hadronic_sigfit_v"$i"_bdt.root  
	for j in leptonic hadronic
	do
		for k in {1..2}
		do
	cd $cur
			cp CMS-HGG_mva_13TeV_datacard_TEMPLATE_percat.txt optimization/CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i"_bdt.txt 
			filename=optimization/CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i"_bdt.txt
			t1=$(((k-1)*3))
			t2=$(((k-1)*3+1))
			t3=$(((k-1)*3+2))
			echo $t1 $t2
			tagpre="TTHHadronicTag"
			if [ $j = "leptonic" ] 
			then
				tagpre="TTHLeptonicTag"
			fi
			sed -i "s/vVERSION/v"$i"_bdt/g" $filename 
			sed -i "s/TAG1/$tagpre$t1/g" $filename 
			sed -i "s/TAG2/$tagpre$t2/g" $filename 
			sed -i "s/TAG3/$tagpre$t3/g" $filename 
			sed -i "s/CHAN/$j/g" $filename 
		cd optimization
		#combineCards.py CMS-HGG_mva_13TeV_datacard_"$j"_cat*_v"$i"_bdt.txt > CMS-HGG_mva_13TeV_datacard_"$j"_v"$i"_bdt.txt
			text2workspace.py CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i"_bdt.txt -o CMS-HGG_mva_13TeV_"$j"_cat"$k"_v"$i"_bdt.root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
			combine CMS-HGG_mva_13TeV_"$j"_cat"$k"_v"$i"_bdt.root -M MultiDimFit --algo=grid  --points=50  -n "$j"_cat"$k"_v"$i"_bdt --setParameterRanges r=0.00,4.0 -m 125.00 -t -1  --expectSignal 1.00 -S 0 --freezeParameters MH 
	done
done
done
