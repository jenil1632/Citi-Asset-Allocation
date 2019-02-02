package com.beans;

public class CashFlow {
	private double bond;
	private double equity;
	private double commodity;
	private double tbills;
	private int year;
	private double portfolio_total;
	
	public CashFlow(double bond, double equity, double commodity, double tbills, int year) {
		super();
		this.bond = bond;
		this.equity = equity;
		this.commodity = commodity;
		this.tbills = tbills;
		this.year = year;
		this.portfolio_total = bond+equity+commodity+tbills;
	}
	
	
	
	
	
	
	public double getBond() {
		return bond;
	}






	public double getEquity() {
		return equity;
	}






	public double getCommodity() {
		return commodity;
	}






	public double getTbills() {
		return tbills;
	}






	public int getYear() {
		return year;
	}






	public double getPortfolio_total() {
		return portfolio_total;
	}






	public void PrintCashFlow() {
		
	
		
		System.out.println();	
		System.out.println("Bonds: "+ bond);
		System.out.println("Equity: "+equity);
		System.out.println("Commodity: "+commodity);
		System.out.println("Deposits: "+ tbills);
		System.out.println("Year: "+year);
		System.out.println("Total Holdings: "+ portfolio_total);
	}
	
	
}
