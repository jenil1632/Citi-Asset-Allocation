<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.beans.*" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
 <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script>
let risky = <%out.println(request.getAttribute("risky"));%>;
let commodities = <%out.println(request.getAttribute("commodities"));%>;
let bonds = <%out.println(request.getAttribute("bonds"));%>;
let equity = <%out.println(request.getAttribute("equity"));%>;
let riskAversion = <% out.println(request.getAttribute("riskAversion"));%>;
let sharpe = <%out.println(request.getAttribute("sharpe")); %>;
let standardDeviation = <%out.println(request.getAttribute("standardDeviation")); %>;
let dp = [
	{ y: (risky*commodities), label: "Commodities" },
	{ y: (risky*bonds), label: "Bonds"},
	{ y: <%out.println(request.getAttribute("tbills")); %>, label: "T-Bills"},
	{ y: (risky*equity), label: "Equities"}
];
let equityData = [];
let bondData = [];
let tbillData = [];
let commodityData = [];
let totalData = [];
let years = [];
let yearly_returns = [];
let equityPercentageReturns = [];
let bondPercentageReturns = [];
let commodityPercentageReturns = [];
	<%
	CashFlow[] flow = (CashFlow[])(request.getAttribute("cashFlow"));
	double[] yearly_returns = (double[])(request.getAttribute("yearly_returns"));
	double[][] indivisualPercentageReturns = (double[][])(request.getAttribute("allAssetClassReturns"));
	int lastYear = (int)(request.getAttribute("lastYear"));
	int len = flow.length;
	for(int i=0;i<len;i++)
	{
		
		double bond = flow[i].getBond();
		double commodities = flow[i].getCommodity();
		double equity = flow[i].getEquity();
		double tbills = flow[i].getTbills();
		int year = flow[i].getYear();
		double portfolio_return = flow[i].getPortfolio_total();
		
	out.println("equityData.push("+equity+");");
	out.println("bondData.push("+bond+");");
	out.println("tbillData.push("+tbills+");");
	out.println("commodityData.push("+commodities+");");
	out.println("years.push("+year+");");
	out.println("totalData.push("+portfolio_return+");");
	} 
	for(int i=0;i<yearly_returns.length;i++)
	{
		out.println("yearly_returns.push({y: "+yearly_returns[i]+" });");
	}
	for(int i=0; i<lastYear;i++)
	{
			out.println("equityPercentageReturns.push({y: "+indivisualPercentageReturns[i][1]+" });");
			out.println("bondPercentageReturns.push({y: "+indivisualPercentageReturns[i][0]+" });");
			out.println("commodityPercentageReturns.push({y: "+indivisualPercentageReturns[i][2]+" });");
	}
	%>
	let completeData = [];
	let histoData = [];
	for(let i = 0;i<tbillData.length;i++)
	{
		histoData.push({ y: tbillData[i], x: years[i] });
	}
	completeData.push(histoData);
	histoData = [];
	for(let i = 0;i<equityData.length;i++)
	{
		histoData.push({ y: equityData[i], x: years[i] });
	}
	completeData.push(histoData);
	histoData = [];
	for(let i = 0;i<bondData.length;i++)
	{
		histoData.push({ y: bondData[i], x: years[i] });
	}
	completeData.push(histoData);
	histoData = [];
	for(let i = 0;i<commodityData.length;i++)
	{
		histoData.push({ y: commodityData[i], x: years[i] });
	}
	completeData.push(histoData);
	let finalData = [];
	let colors = ["#696661", "#EDCA93", "#695A42", "#B6B1A8"];
	let legends = ["T-BILLS", "EQUITIES", "BONDS", "COMMODITIES"];
	for(var j=0;j<4;j++)
		{
		let ansObj = {
				type: "stackedColumn",
				showInLegend: true,
				color: colors[j],
				name: legends[j],
				dataPoints: completeData[j]
				};
		finalData.push(ansObj);
		}
 let generatePieChart = function () {
var chart = new CanvasJS.Chart("chartContainer1", {
	theme: "light2",
	animationEnabled: false,
	title: {
		text: "Portfolio Distribution"
	},
	subtitles: [{
		text: "w.r.t. Risk Aversion",
		fontSize: 16
	}],
	data: [{
		type: "pie",
		indexLabelFontSize: 18,
		radius: 300,
		indexLabel: "{label} - {y}",
		yValueFormatString: "###0.0'%'",
		click: explodePie,
		dataPoints: dp
	}]
});
chart.render();

function explodePie(e) {
	for(var i = 0; i < e.dataSeries.dataPoints.length; i++) {
		if(i !== e.dataPointIndex)
			e.dataSeries.dataPoints[i].exploded = false;
	}
}

}

let generateHistogram = function(){
var chart2 = new CanvasJS.Chart("chartContainer2", {
	animationEnabled: true,
	title:{
		text: "Asset class wise Portfolio Distribution",
		fontFamily: "arial black",
		fontColor: "#695A42"
	},
	axisX: {
		interval: 1,
		intervalType: "year"
	},
	axisY:{
		valueFormatString:"$#0bn",
		gridColor: "#B6B1A8",
		tickColor: "#B6B1A8"
	},
	toolTip: {
		shared: true,
		content: toolTipContent
	},
	data: finalData
});
chart2.render();

function toolTipContent(e) {
	var str = "";
	var total = 0;
	var str2, str3;
	for (var i = 0; i < e.entries.length; i++){
		var  str1 = "<span style= 'color:"+e.entries[i].dataSeries.color + "'> "+e.entries[i].dataSeries.name+"</span>: $<strong>"+e.entries[i].dataPoint.y+"</strong>bn<br/>";
		total = e.entries[i].dataPoint.y + total;
		str = str.concat(str1);
	}
	str2 = "<span style = 'color:DodgerBlue;'><strong>"+(e.entries[0].dataPoint.x).getFullYear()+"</strong></span><br/>";
	total = Math.round(total * 100) / 100;
	str3 = "<span style = 'color:Tomato'>Total:</span><strong> $"+total+"</strong>bn<br/>";
	return (str2.concat(str)).concat(str3);
}
}

let generateLineChart1 = function()
{
	var chart3 = new CanvasJS.Chart("chartContainer3", {
		animationEnabled: true,
		theme: "light2",
		title:{
			text: "Portfolio yearwise returns"
		},
		axisY:{
			includeZero: false
		},
		data: [{        
			type: "line",       
			dataPoints: yearly_returns
		}]
	});
	chart3.render();
	}
	
	
let generateLineChart2 = function()
{
	var chart4 = new CanvasJS.Chart("chartContainer4", {
		animationEnabled: true,
		theme: "light2",
		title:{
			text: "Bond yearwise returns"
		},
		axisY:{
			includeZero: false
		},
		data: [{        
			type: "line",       
			dataPoints: bondPercentageReturns
		}]
	});
	chart4.render();
	}
	
let generateLineChart3 = function()
{
	var chart5 = new CanvasJS.Chart("chartContainer5", {
		animationEnabled: true,
		theme: "light2",
		title:{
			text: "Equity yearwise returns"
		},
		axisY:{
			includeZero: false
		},
		data: [{        
			type: "line",       
			dataPoints: equityPercentageReturns
		}]
	});
	chart5.render();
	}
	
let generateLineChart4 = function()
{
	var chart6 = new CanvasJS.Chart("chartContainer6", {
		animationEnabled: true,
		theme: "light2",
		title:{
			text: "Commodity yearwise returns"
		},
		axisY:{
			includeZero: false
		},
		data: [{        
			type: "line",       
			dataPoints: commodityPercentageReturns
		}]
	});
	chart6.render();
	}
	


function generateData()
{
	
	}
function start()
{
	
	generatePieChart();
	generateHistogram();
	generateLineChart1();
	generateLineChart2();
	generateLineChart3();
	generateLineChart4();
	}
window.onload = start;


</script>
</head>
<body>
<h1></h1>
	<div class="slidecontainer">
  <input type="range" min="10" max="50" class="slider" id ="myRange">
</div>
<div id="chartContainer1" style="margin-bottom: 500px;"></div>
<div id="chartContainer2" style="margin-bottom: 1000px;"></div>
<div id="chartContainer3" style="margin-bottom: 1500px;"></div>
<div id="chartContainer4" style="margin-bottom: 2000px;"></div>
<div id="chartContainer5" style="margin-bottom: 2500px;"></div>
<div id="chartContainer6" style="margin-bottom: 3000px;"></div>
<script src="js/canvasjs.min.js"></script>
<script src="js/chartGenerator.js"></script>
</div>
</body>
</html>
    