using namespace RooFit;
void print(){
	gROOT->ProcessLine("gSystem->AddIncludePath(\"-I$ROOFITSYS/include/\")");
	gROOT->ProcessLine("gSystem->Load(\"libRooFit\")");
	gROOT->ProcessLine("gSystem->Load(\"libHiggsAnalysisCombinedLimit.so\")");
//	TFile *f = new TFile ("CMS-HGG_mva_13TeV_datacardMuScan.root");
	TFile *f = new TFile ("CMS-HGG_mva_13TeV_datacard_fullRun2_cp_1cat.root");
//	TFile *f = new TFile ("CMS-HGG_mva_13TeV_datacard_jhu_ht.root");
	RooWorkspace *w=(RooWorkspace*)f->Get("w");
	w->var("MH")->setVal(125);
	w->var("x")->setVal(0);
	w->Print();
//	TFile *foff = new TFile ("../../ForMeng/2017/CMS-HGG_sigfit_mva_TTH_TTHHadronicTag_2.root");
//
//	RooWorkspace *w=(RooWorkspace*)f->Get("wsig_13TeV");
//	RooWorkspace *woff=(RooWorkspace*)foff->Get("wsig_13TeV");
//
//	woff->var("MH")->setVal(125);
//	w->var("MH")->setVal(125);
//	RooRealVar *mass = w->var("CMS_hgg_mass");
//	RooAbsReal *normoff=woff->function("hggpdfsmrel_13TeV_TTH_TTHHadronicTag_2_normThisLumi");
//	normoff->Print();
//	RooAbsPdf *pdfoff= woff->pdf("hggpdfsmrel_13TeV_TTH_TTHHadronicTag_2");
//
//	RooAbsReal *norm=w->function("hggpdfsmrel_13TeV_tth_TTHHadronicTag0_normThisLumi");
//	norm->Print();
//	//RooAbsPdf *pdf = w->pdf("hggpdfsmrel_13TeV_tth_TTHHadronicTag0");
//	RooAbsPdf *pdf = w->pdf("hggpdfsmrel_13TeV_tth_TTHHadronicTag0");
//	pdf->Print("v");
//
//	RooPlot *frame = mass->frame(Range(105,140)); 
//
//	pdfoff->plotOn(frame,Normalization(normoff->getVal(),RooAbsReal::NumEvent),LineColor(2));
//	pdf->plotOn(frame,Normalization(norm->getVal(),RooAbsReal::NumEvent),LineColor(4));
//	frame->Draw();
//	gPad->Print("tag2_pdf.png");
//	return;
//
}
