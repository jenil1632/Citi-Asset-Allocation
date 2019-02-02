package com.beans;

public class RiskScorePortfolio {
	
	
	
	private double risky_percent;
	private double risk_portfolio;
	
	
	public double getRisky_percent() {
		return risky_percent;
	}

	public double getRisk_portfolio() {
		return risk_portfolio;
	}

	public void calculatePortfolioRiskScore(int age, double tbills, double bonds, double equity, double gold) {
		
		double val= 100-age;
		double total = tbills+bonds+equity+gold;
		risky_percent = (equity /total)*100;
		
		val=val/10;
		double scaler = val;
		
		
		risk_portfolio = 1;
		for(int i=3;i<13;i++) {
			scaler=i*val;
			if(risky_percent<scaler) {
				scaler = (i-1)*val;
				risk_portfolio = i+(risky_percent-scaler)/(scaler);
				break;
			}
			
		}
		
		if(risk_portfolio!=1)
		risk_portfolio=risk_portfolio-2;
		else
		risk_portfolio = 10;	
		
		
		
	
	}
	
		
		
		
	}


