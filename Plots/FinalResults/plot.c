void plot(){
	TChain *t=new TChain ("limit");
	t->Add("higgsCombineMuScanJob0.MultiDimFit.mH125.root");
	t->Draw("2*deltaNLL:r");
	gPad->Print("scan.png");
}
