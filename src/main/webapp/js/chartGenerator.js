$('#myRange').val(riskAversion);
$('#myRange').on('input change', ()=>{
	let riskyAssets = sharpe/(standardDeviation*$('#myRange').val());
	dp[0].y = riskyAssets*commodities;
	dp[1].y = riskyAssets*bonds;
	dp[2].y = (1-riskyAssets)*100;
	dp[3].y = riskyAssets*equity;

  generatePieChart();
});


