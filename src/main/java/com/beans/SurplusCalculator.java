package com.beans;

public class SurplusCalculator {
	
	public static double surplusWithTime(int years, double income, double expense) {
		
		income = income*Math.pow(1.045, years);
		expense = expense*Math.pow(1.03, years);		
		return (income-expense);
	}

}
