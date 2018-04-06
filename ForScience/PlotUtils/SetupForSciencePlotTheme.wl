(* ::Package:: *)

SetupForSciencePlotTheme::usage=FormatUsage@"SetupForSciencePlotTheme[opt_1\[Rule]val_1,\[Ellipsis]] changes options of the ForScience plot theme. See '''Options[SetupForSciencePlotTheme]''' for possible options.";
ResetForSciencePlotTheme::usage=FormatUsage@"ResetForSciencePlotTheme[] reset the options of the ForScience plot theme.";


Begin["`Private`"]


$BasicPlots={ListContourPlot};
$PolarPlots={ListPolarPlot};
$PolarPlotsNoJoin={PolarPlot};
$ThemedPlots={LogLogPlot,LogPlot,ListLogLogPlot,ListLogPlot,ListLinePlot,ListPlot,Plot,ParametricPlot,SmoothHistogram};
$Plots3D={ListPlot3D,ListPointPlot3D,ParametricPlot3D};
$HistogramType={Histogram,BarChart};
$Histogram3DType={Histogram3D};


SetupForSciencePlotTheme[o:OptionsPattern[]]:=Module[
  {
    SmallThemeFontStyle=Directive[Black,FontSize->OptionValue[FontSize]OptionValue["FontRatio"],FontFamily->OptionValue[FontFamily]],
    ThemeFontStyle=Directive[Black,FontSize->OptionValue[FontSize],FontFamily->OptionValue[FontFamily]],
    ThicknessStyle=Prepend[Thickness@Scaled@OptionValue[Thickness]]/@List/@ColorData[112,"ColorList"]
  }, 
  SetOptions[SetupForSciencePlotTheme,o];
  Themes`AddThemeRules["ForScience",#,
	  LabelStyle->ThemeFontStyle,
	  PlotRangePadding->0
  ]&/@Plots3D;
  
  Themes`AddThemeRules["ForScience",#,
	  LabelStyle->ThemeFontStyle,
	  PlotRangePadding->0,
	  PlotStyle->ThicknessStyle,
	  LabelStyle->ThemeFontStyle,
	  FrameStyle->ThemeFontStyle,
	  FrameTicksStyle->SmallThemeFontStyle,
	  Frame->True,
	  PlotRangePadding->0,
	  Axes->False
  ]&/@$ThemedPlots;
  
  Themes`AddThemeRules["ForScience",#,
	  LabelStyle->ThemeFontStyle,
	  PlotRangePadding->0,
	  PlotStyle->ColorData[112,"ColorList"],
	  LabelStyle->ThemeFontStyle,
	  FrameStyle->ThemeFontStyle,
	  FrameTicksStyle->SmallThemeFontStyle,
	  Frame->True,
	  PlotRangePadding->0,
	  Axes->False
  ]&/@$BasicPlots;
  
  Themes`AddThemeRules["ForScience",#,
	  Joined->True,
	  Mesh->All,
	  PolarGridLines->Automatic,
	  PlotStyle->ColorData[112,"ColorList"],
	  PolarTicks->{"Degrees",NiceRadialTicks},
	  TicksStyle->SmallThemeFontStyle,
	  Frame->False,
	  PolarAxes->True,
	  PlotRangePadding->Scaled[0.1]
  ]&/@$PolarPlots;
  
  Themes`AddThemeRules["ForScience",#,
	  Mesh->All,
	  PolarGridLines->Automatic,
	  PlotStyle->ColorData[112,"ColorList"],
	  PolarTicks->{"Degrees",NiceRadialTicks},
	  TicksStyle->SmallThemeFontStyle,
	  Frame->False,
	  PolarAxes->True,
	  PlotRangePadding->Scaled[0.1]
  ]&/@$PolarPlotsNoJoin;
  
  Themes`AddThemeRules["ForScience",#,
      ChartStyle->{ColorData[112,"ColorList"],None},
	  LabelStyle->ThemeFontStyle,
	  Frame->True,
	  FrameStyle->ThemeFontStyle,
	  FrameTicksStyle->SmallThemeFontStyle
  ]&/@$HistogramType;
  
  Themes`AddThemeRules["ForScience",#,
      ChartStyle->{ColorData[112,"ColorList"],None},
	  LabelStyle->ThemeFontStyle,
	  FrameStyle->ThemeFontStyle,
	  FrameTicksStyle->SmallThemeFontStyle
  ]&/@$Histogram3DType;
]
SyntaxInformation[SetupForSciencePlotTheme]={"ArgumentsPattern"->{OptionsPattern[]}};

ResetForSciencePlotTheme[]:=(
  Options[SetupForSciencePlotTheme]={FontSize->20,FontFamily->"Times","FontRatio"->0.9,"Thickness"->0.005};
  SetupForSciencePlotTheme[]
)
ResetForSciencePlotTheme[]
SyntaxInformation[ResetForSciencePlotTheme]={"ArgumentsPattern"->{}};


End[]