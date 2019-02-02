<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.beans.*" %>
<!doctype html>
<html lang="en">

<head>
	<title>Asset Allocation Dashboard</title>
	<link rel="shortcut icon" href="template/assets/img/citi-logo-small.ico" type="image/x-icon">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="template/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="template/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="template/assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="template/assets/vendor/chartist/css/chartist-custom.css">
		<link rel="stylesheet" href="css/chart.css">
	
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="template/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="template/assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="template/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="template/assets/img/citi-logo-small.png">
	<script src="template/assets/vendor/jquery/jquery.min.js"></script>
	
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
	int lastYear = (Integer)(request.getAttribute("lastYear"));
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
		out.println("yearly_returns.push({x: "+(i+1)+", y: "+yearly_returns[i]+" });");
	}
	for(int i=0; i<lastYear;i++)
	{
			out.println("equityPercentageReturns.push({x: "+(i+1)+", y: "+indivisualPercentageReturns[i][1]+" });");
			out.println("bondPercentageReturns.push({x: "+(i+1)+", y: "+indivisualPercentageReturns[i][0]+" });");
			out.println("commodityPercentageReturns.push({x: "+(i+1)+", y: "+indivisualPercentageReturns[i][2]+" });");
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
	let colors = ["#7cb5ec", "#8fed7d", "#434348", "#f7a35c"];
	let legends = ["T-Bills", "Equities", "Bonds", "Commodities"];
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
	theme: "light2",
	title:{
		text: "Asset class wise Portfolio Distribution",
		margin: 35
	},
	dataPointMaxWidth: 40,
	axisX: {
		interval: 1,
		intervalType: "year",
		title: "Year Number"
	},
	axisY:{
		valueFormatString:"$#,###",
		gridColor: "#B6B1A8",
		tickColor: "#B6B1A8",
		title: "Portfolio Value"
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
		var  str1 = "<span style= 'color:"+e.entries[i].dataSeries.color + "'> "+e.entries[i].dataSeries.name+"</span>: $<strong>"+(Math.round(e.entries[i].dataPoint.y * 100)/100)+"</strong><br/>";
		total = e.entries[i].dataPoint.y + total;
		str = str.concat(str1);
	}
	str2 = "<span style = 'color:DodgerBlue;'><strong>Year: "+(e.entries[0].dataPoint.x)+"</strong></span><br/>";
	total = Math.round(total * 100) / 100;
	str3 = "<span style = 'color:Tomato'>Total:</span><strong> $"+total+"</strong><br/>";
	return (str2.concat(str)).concat(str3);
}
}

let generateLineChart1 = function()
{
	var chart3 = new CanvasJS.Chart("chartContainer3", {
		animationEnabled: true,
		theme: "light2",
		title:{
			text: "Portfolio yearwise returns (%)",
			margin: 35
		},
		axisX:{
			title: "Year Number",
			interval: 1
		},
		axisY:{
			includeZero: false,
			title: "Annual Expected Returns (%)",
			interlacedColor: "#f5f5f5"
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
			text: "Individual Asset Class Yearwise Returns",
			margin: 35
		},
		axisX:{
			title: "Year Number",
			interval: 1
		},
		axisY:{
			includeZero: false,
			title: "Annual Expected Returns (%)",
			interlacedColor: "#f5f5f5"
		},
		data: [{        
			type: "line",       
			dataPoints: bondPercentageReturns,
			name: "Bonds",
			showInLegend: true
		},
		{
			type: "line",
			dataPoints: equityPercentageReturns,
			name: "Equities",
			markerType: "square",
			showInLegend: true
		},
		{
			type: "line",
			dataPoints: commodityPercentageReturns,
			name: "Commodities",
			markerType: "triangle",
			showInLegend: true
		}
		]
	});
	chart4.render();
	}

function start()
{
	
	generatePieChart();
	generateHistogram();
	generateLineChart1();
	generateLineChart2();
	}
window.onload = start;


</script>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top" style="height:60px">
			<div class="brand" style="margin:0px; padding-bottom:10px; padding-top:10px">
				<img src="images/Logo.png" style="width:15%">
			</div>
			<div class="container-fluid" style="padding-top:0px">
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding-top:18px"><img src="template/assets/img/user.png" class="img-circle" alt="Avatar"> <span><%out.println(session.getAttribute("username")); %></span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a><%out.println(session.getAttribute("username")); %></a></li>
								<li><a href="form.jsp"><i class="lnr lnr-user"></i> <span>Questionnaire</span></a></li>
								<li><a href="about.html"><i class="lnr lnr-cog"></i> <span>About Us</span></a></li>
								<li><a href="Logout"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						<!-- <li>
							<a class="update-pro" href="https://www.themeineed.com/downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
						</li> -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="#" class="active"><i class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
						<li><a href="form.jsp" class=""><i class="lnr lnr-code"></i> <span>Questionnaire</span></a></li>
						<li><a href="about.html" class=""><i class="lnr lnr-chart-bars"></i> <span>About Us</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<%int goalNum = (Integer) request.getAttribute("goalNum");
					String[] goalType = (String[]) request.getAttribute("goalType");
					int[] goalYears = (int[]) request.getAttribute("years");
					double[] goals = (double[]) request.getAttribute("goals");
					double[] expected = (double[]) request.getAttribute("expected");
					boolean[] check = (boolean[]) request.getAttribute("check");
					for(int i=0; i<goalNum;i++){
						if(check[i]){
							out.println("<div class=\"col-md-3\"><div class=\"panel\" id = 'panel"+(i+1)+"'><div class=\"panel-heading\"><h3 class=\"panel-title\" style='color: #00cc00; font-weight: 500;'>Goal "+(i+1)+"</h3></div></div></div>");
							out.println("<div id='myModal"+(i+1)+"' class='modal fade'><div class='modal-dialog modal-lg'><div class='modal-content'><!-- Header --><div class='modal-header'><h1>Goal "+(i+1)+": "+goalType[i]+"</h1></div><!-- Body --><div class='modal-body'><p>"+goalType[i]+" by the year: "+(2018+goalYears[i])+"<br><br>Current value entered by you: "+goals[i]+"<br><br>Expected future value: "+expected[i]+"</p></div><!-- Footer --><div class='modal-footer modal-footer--mine'><img src='images/tick.png' style='width:10%; float: left;'><span style='float: left; margin:20px 0 0 5px; font-size:20px;	'>Goal achieved</span><button type='button' class='btn btn-default' data-dismiss='modal' style='margin-top: 1em'>Close</button></div></div></div></div>");
						}
						else{
							out.println("<div class=\"col-md-3\"><div class=\"panel\" id = 'panel"+(i+1)+"'><div class=\"panel-heading\"><h3 class=\"panel-title\" style='color: #e50000; font-weight: 500;'>Goal "+(i+1)+"</h3></div></div></div>");
							out.println("<div id='myModal"+(i+1)+"' class='modal fade'><div class='modal-dialog modal-lg'><div class='modal-content'><!-- Header --><div class='modal-header'><h1>Goal "+(i+1)+": "+goalType[i]+"</h1></div><!-- Body --><div class='modal-body'><p>"+goalType[i]+" by the year: "+(2018+goalYears[i])+"<br><br>Current value entered by you: "+goals[i]+"<br><br>Expected future value: "+expected[i]+"</p></div><hr><div class='modal-body'><img src='images/cross.png' style='width:10%; float: left;'><span style='float: left; margin: 15px 0 0 5px; font-size:20px;'>Goal not achieved</span></div><div class='modal-body'><p style='margin: 40px 0 0 10px;'>In order to achieve your goal either:<ul><li>Increase risk appetite</li><li>Increase time period for goal</li><li>Lower expected returns</li></ul></p></div><!-- Footer --><div class='modal-footer modal-footer--mine'><button type='button' class='btn btn-default' data-dismiss='modal' style='margin-top: 1em'>Close</button></div></div></div></div>");
						}
					}
					
					%>
					<!-- END OVERVIEW -->
				</div>
			</div>

	<div>
	<div >
	<div class="charts" id="chartContainer1" style="margin-top:0"></div>
	<h3 class = "text-center" style="margin-bottom: 15px">Change your Risk! </h3>
		<div class="slidecontainer" style="max-width:200px; margin:0 auto">
	<form method="post" action = "Recalculate">
	  <input type="range" min="10" max="50" class="slider" id ="myRange" name = "myRange" list="tickmarks">
	  <datalist id="tickmarks" style = "display: block">
	  <option value="10" label="High risk" style="display: inline-block">
	  <option value="50" label="low risk" style="display: inline-block; margin-left: 88px">
	  </datalist>
	  <button class = "btn btn-primary btn-lg" type = "submit" style="display: block; background-color: #2b333e; margin: 40px auto 0px">Recalculate</button>
	  </form>
	</div>
	<div class="charts" id="chartContainer2"></div>
	<div class="charts" id="chartContainer3"></div>
	<div class="charts" id="chartContainer4"></div>
	<form action="email" method="post">
	    <input type = "text" name = "t-bills" style = "display: none" id = "t-bills">
	    <input type = "text" name = "commodities" style = "display: none" id = "commodities">
	    <input type = "text" name = "equities" style = "display: none" id = "equities">
	    <input type = "text" name = "bonds" style = "display: none" id = "bonds">
		<button class = "btn btn-primary btn-lg"  type="submit" id = "export" style="display: block; background-color: #2b333e; margin: 40px auto 0px">Accept</button>
	</form>
	</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
	</div>

	<script src="js/canvasjs.min.js"></script>
	<script src="js/chartGenerator.js"></script>
	<script>$('#panel1').on('click', ()=>{
		$('#myModal1').modal('show');
	});</script>
		<script>$('#panel2').on('click', ()=>{
		$('#myModal2').modal('show');
	});</script>
		<script>$('#panel3').on('click', ()=>{
		$('#myModal3').modal('show');
	});</script>
		<script>$('#panel4').on('click', ()=>{
		$('#myModal4').modal('show');
	});</script>
	<script type="text/javascript">
	$('#export').on('click', ()=>{
		$("#t-bills").val(Math.round((1-risky)*10000)/100);
		$("#commodities").val(Math.round(risky*commodities*100)/100);
		$("#bonds").val(Math.round(risky*bonds*100)/100);
		$("#equities").val(Math.round(risky*equity*100)/100);
	});
	
	</script>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="template/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="template/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="template/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="template/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="template/assets/scripts/klorofil-common.js"></script>
</body>

</html>
