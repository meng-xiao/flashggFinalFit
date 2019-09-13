#!/bin/bash
cur=$PWD
mkdir optimization
for i in {2..5}
do
	for j in leptonic hadronic
	do
		for k in {1..3}
		do
			#cd /afs/cern.ch/work/x/xiaomeng/test/myWorkingArea/CMSSW_8_1_0/src/flashggFinalFit/Plots/FinalResults
			cd $cur
			cp CMS-HGG_mva_13TeV_datacard_TEMPLATE_percat.txt optimization/CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i".txt 
			filename=optimization/CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i".txt
			t1=$(((k-1)*2))
			t2=$(((k-1)*2+1))
			echo $t1 $t2
			tagpre="TTHHadronicTag"
			if [ $j = "leptonic" ] 
			then
				tagpre="TTHLeptonicTag"
			fi
			sed -i "s/vVERSION/v$i/g" $filename 
			sed -i "s/TAG1/$tagpre$t1/g" $filename 
			sed -i "s/TAG2/$tagpre$t2/g" $filename 
			sed -i "s/CHAN/$j/g" $filename 
			cd optimization
			text2workspace.py CMS-HGG_mva_13TeV_datacard_"$j"_cat"$k"_v"$i".txt -o CMS-HGG_mva_13TeV_"$j"_cat"$k"_v"$i".root -P HiggsAnalysis.CombinedLimit.HiggsJPC:twoHypothesisHiggs  --PO=muFloating
			combine CMS-HGG_mva_13TeV_"$j"_cat"$k"_v"$i".root -M MultiDimFit --algo=grid  --points=50  -n version$i --setParameterRanges r=0.00,4.0 -m 125.00 -t -1  --expectSignal 1.00 -S 0 --freezeParameters MH 
		done
	done
done
