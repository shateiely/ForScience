(* ::Package:: *)

Guide;
GuideQ;


Abstract;


Begin["`Private`"]


Attributes[GuideQ]={HoldFirst};
GuideQ[_]=False;


HoldPattern[gd_=Guide[title_]]^:=(
  DocumentationTitle[gd]^=title;
  GuideQ[gd]^=True;
  gd
)


AppendTo[$DocumentationTypes,"Guide"->"Guides"];


DocumentationOfTypeQ[sym_,"Guide"]:=GuideQ@sym


DocumentationSummary[gd_,"Guide"]:=StripFormatting@ParseToDocEntry@Abstract@gd


MakeDocumentationContent[gd_,"Guide",nb_,opts:OptionsPattern[]]:=(
  NotebookWrite[nb,Cell[DocumentationTitle[gd],"GuideTitle"]];
  #[gd,nb,FilterRules[{opts},Options@#]]&/@$DocumentationSections["Guide"]
)


End[]
