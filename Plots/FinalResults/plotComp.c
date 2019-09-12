#include "CMS_lumi.C"
const int nmax=5;
int co[14]={1,2,3,4,6,kViolet,kCyan, kMagenta,kBlue-10, 3,kYellow,93};
int sy[14]={1,2,3,4,6,kViolet,kCyan, kMagenta,kBlue-10, 3,kYellow,93};
TString tex[nmax]={
	"BDT boundary=-0.2",
	"BDT boundary=-0.1",
	"BDT boundary=0",
	"BDT boundary=0.1",
	"BDT boundary=0.2"
//	"main category",
//	"no main category"
//	"4 bins"
//	"cp",
//	"tag0",
//	"tag1",
//	"tag2"
};
TString rootfname[nmax]={
//	"higgsCombineMuScanJob0.MultiDimFit.mH125.root",
//	"higgsCombinefcp_scan.MultiDimFit.mH125.root",
//	"higgsCombinefcp_scan_4bins.MultiDimFit.mH125.root",
//	"higgsCombinefcp_scan_fullRun2_stat.MultiDimFit.mH125.root",
//	"higgsCombinefcp_scan_fullRun2_2cat_stat.MultiDimFit.mH125.root"
	"optimization/higgsCombineversion1.MultiDimFit.mH125.root",
	"optimization/higgsCombineversion2.MultiDimFit.mH125.root",
	"optimization/higgsCombineversion3.MultiDimFit.mH125.root",
	"optimization/higgsCombineversion4.MultiDimFit.mH125.root",
	"optimization/higgsCombineversion5.MultiDimFit.mH125.root"
//	"higgsCombinefcp_scan_fullRun2.MultiDimFit.mH125.root"
//	"higgsCombineMuScanFull.MultiDimFit.mH125.root"
//	"higgsCombineMuScanJob0_tag0.MultiDimFit.mH125.root",
//	"higgsCombineMuScanJob0_tag1.MultiDimFit.mH125.root",
//	"higgsCombineMuScanJob0_tag2.MultiDimFit.mH125.root"
};

void plotComp(){
	gStyle->SetOptStat(0);
	TCanvas *c=new TCanvas("c","",800,600);
	TCanvas *c2=new TCanvas("c2","",800,600);
	TLegend *leg = new TLegend(0.44,0.75,0.6,0.93);
	leg->SetFillColor(0);
	leg->SetLineColor(0);
	leg->SetBorderSize(0);
	leg->SetFillStyle(0);
	leg->SetTextFont(42);
	leg->SetTextSize(0.03);
	for (int i=0;i<nmax;i++){
		TChain *t=new TChain ("limit");
		t->Add(rootfname[i]);
		c->cd();
//		t->Draw("(2*deltaNLL):r_ttH","");
		t->Draw("(2*deltaNLL):x","");
		//t->Draw("(2*deltaNLL):r","");
		TGraph *gr0 = (TGraph*) gROOT->FindObject("Graph")->Clone();
		c2->cd();
		gr0->Sort();
//		gr0->SetMarkerColor(co[i]);
//		gr0->SetMarkerStyle(sy[i]);
		gr0->SetLineColor(co[i]);
		gr0->SetLineWidth(2);
		gr0->GetYaxis()->SetRangeUser(0,8);
		gr0->GetYaxis()->SetTitle("-2#Deltaln L");
		gr0->GetXaxis()->SetTitle("f_{CP}^{ttH}");
//		gr0->GetXaxis()->SetRangeUser(-0.1,0.1);
		gr0->GetXaxis()->SetRangeUser(0,1);
		if(i==0)
			gr0->Draw("al");
		else
			gr0->Draw("l");
		leg->AddEntry(gr0,tex[i],"l");
	}
	        CMS_lumi( c2, 4, 0, true);
	leg->Draw();
	c2->Print("scan_tune.png");
	c2->Print("scan_tune.pdf");
}
