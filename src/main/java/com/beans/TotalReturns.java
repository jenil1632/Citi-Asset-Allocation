package com.beans;

public class TotalReturns {
	
	
	public static double getTotalReturns(double port_total,CashFlow [] flow, int year, double[] goals,int[] years, boolean[] check, double income, double expense) {
		
		double current = 0;
		double previous = 0;
		double inv_amt = 0;
		
		if(year == 0) {
			current = flow[year].getPortfolio_total();
			previous = port_total;
			inv_amt = income - expense;
			previous = previous+inv_amt;
		}
		else {
		current = flow[year].getPortfolio_total();
		previous =flow[year-1].getPortfolio_total();
		inv_amt = SurplusCalculator.surplusWithTime(year, income, expense);
		previous = previous+inv_amt;
		}
		
		int i;

		
		for ( i = 0;i<years.length;i++) {
		if((year==years[i])&&(check[i])) {
			previous = previous - goals[i];
		}
		}
			
		return ((current-previous)*100/previous);
		
	}
	

}
