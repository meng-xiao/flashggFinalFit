void getworkspace(){
	gROOT->ProcessLine("gSystem->AddIncludePath(\"-I$ROOFITSYS/include/\")");
	gROOT->ProcessLine("gSystem->Load(\"libRooFit\")");
	gROOT->ProcessLine("gSystem->Load(\"libHiggsAnalysisCombinedLimit.so\")");
	TFile *f = new TFile("CMS-HGG_mva_13TeV_datacardMuScan.root");
	RooWorkspace *w = (RooWorkspace*)f->Get("w");
	RooAbsPdf *tag1=w->pdf("pdf_binTTHHadronicTag1_13TeV");
	RooRealVar *mass = w->var("CMS_hgg_mass");
	RooRealVar *r = w->var("r");
	r->setVal(1);
	RooPlot *frame=mass->frame(); 
	tag1->plotOn(frame,RooFit::Normalization(1,RooAbsReal::ScaleType(3)));
	cout<< tag1->expectedEvents(*mass)<<endl;
	r->setVal(0);
	tag1->plotOn(frame,RooFit::Normalization(1,RooAbsReal::ScaleType(3)));
	frame->Draw();
	cout<< tag1->expectedEvents(*mass)<<endl;
	gPad->Print("tag1.png");
	
}
