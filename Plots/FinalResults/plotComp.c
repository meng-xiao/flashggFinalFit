#include "CMS_lumi.C"
const int nmax=10;
int co[14]={1,2,3,4,6,kViolet,kCyan, kMagenta,kBlue-10, 3,kYellow,93};
int sy[14]={1,2,3,4,6,kViolet,kCyan, kMagenta,kBlue-10, 3,kYellow,93};
TString tex[nmax]={
//	"BDT boundary=-0.2",
//	"BDT boundary=-0.1",
//	"BDT boundary=0",
//	"BDT boundary=0.1",
//	"BDT boundary=0.2"
//"MVA boundary = .9877",
////"MVA boundary = .9897",
//"MVA boundary = .9917",
//"MVA boundary = .9937",
//"MVA boundary = .9957",
//"MVA boundary = .9977"
	"v1",
	"v2",
	"v3",
	"v4",
	"v5",
	"v6",
	"v7",
	"v8",
	"v9",
	"v10"
};
TString tex_lep[nmax]={
	"v1",
	"v2",
	"v3",
	"v4",
	"v5",
	"v6",
	"v7",
	"v8",
	"v9",
	"v10"
//"MVA boundary = .9253",
////"MVA boundary = .9346",
//"MVA boundary = .9439",
//"MVA boundary = .9532",
//"MVA boundary = .9625",
//"MVA boundary = .9718"
//	"BDT boundary=-0.2",
//	"BDT boundary=-0.05",
//	"BDT boundary=0",
//	"BDT boundary=0.05",
//	"BDT boundary=0.1"
};
TString rootfname[nmax]={
//	"higgsCombineMuScanJob0.MultiDimFit.mH125.root",
//	"higgsCombinefcp_scan.MultiDimFit.mH125.root",
//	"higgsCombinefcp_scan_4bins.MultiDimFit.mH125.root",
//	"higgsCombinefcp_scan_fullRun2_stat.MultiDimFit.mH125.root",
//	"higgsCombinefcp_scan_fullRun2_2cat_stat.MultiDimFit.mH125.root"
//	"optimization/higgsCombineversion1.MultiDimFit.mH125.root",

	"optimization/higgsCombineversion1_bdt.MultiDimFit.mH125.root",
//	"optimization/higgsCombineversion2_bdt.MultiDimFit.mH125.root",
	"optimization/higgsCombineversion3_bdt.MultiDimFit.mH125.root",
	"optimization/higgsCombineversion4_bdt.MultiDimFit.mH125.root",
	"optimization/higgsCombineversion5_bdt.MultiDimFit.mH125.root",
	"optimization/higgsCombineversion6_bdt.MultiDimFit.mH125.root"

//	"higgsCombinefcp_scan_fullRun2.MultiDimFit.mH125.root"
//	"higgsCombineMuScanFull.MultiDimFit.mH125.root"
//	"higgsCombineMuScanJob0_tag0.MultiDimFit.mH125.root",
//	"higgsCombineMuScanJob0_tag1.MultiDimFit.mH125.root",
//	"higgsCombineMuScanJob0_tag2.MultiDimFit.mH125.root"
};

void dodo(TString fn="version"){
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
		TString rfn=rootfname[i];
		rfn.ReplaceAll("version",fn);
		t->Add(rfn);
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
		if(fn.Contains("lep"))
		leg->AddEntry(gr0,tex_lep[i],"l");
		else
		leg->AddEntry(gr0,tex[i],"l");
	}
	        CMS_lumi( c2, 4, 0, true);
	leg->Draw();
	c2->Print(fn+".png");
	c2->Print(fn+".pdf");
}
void plotComp(){
	for (int i =0;i<2;i++){
		TString treename = Form("leptonic_cat%d_v",i+1);
		TString treename_had = Form("hadronic_cat%d_v",i+1);
		cout<< treename<<endl;
	dodo(treename);
	dodo(treename_had);
	}
//dodo("leptonic_v");
//dodo("hadronic_v");
////	dodo("version");
}
