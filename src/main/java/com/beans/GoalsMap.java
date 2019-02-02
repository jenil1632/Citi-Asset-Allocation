package com.beans;

import java.util.ArrayList;
import java.util.List;

import com.pojo.PortfolioPoint;

public class GoalsMap {

	private boolean[] achieved = new boolean[4];
	private double[][] assetReturn = new double[10][];
	

	public double[][] getAssetReturn() {
		return assetReturn;
	}




	public boolean[] GoalCheck(int[] years,  double[]goals, double riskyAssetWeight, PortfolioPoint opt,double port_total,double income,double expense,CashFlow [] flow) {
		
		double [] assets = new double[4]; 

		for(int i=0;i<goals.length;i++) {
			
		

			int year;			
			if(i==0) year = 1;
			else { 
				year = years[i-1]+1;
			}
			
			
			while(year<=years[i]) {
				AllocateAssets assetPortfo = new AllocateAssets();
				
	        	
				assets = assetPortfo.cashFlow(SurplusCalculator.surplusWithTime(year, income, expense), opt, port_total, riskyAssetWeight );
				assetReturn[year-1] = assetPortfo.getRandomReturn();
				
	        	
	        	CashFlow current = new CashFlow(assets[0], assets[1], assets[2], assets[3], year);
	        	flow[year-1] = current;	        		        	
	        	port_total = assets[0]+assets[1]+assets[2]+assets[3];
	        	year++;	        	
	
			
			}
	
 
	    
	       
	        if(port_total>goals[i]) {
	        port_total = port_total - goals[i];
	        achieved[i] = true;
	        assets = AllocateAssets.splitUP(port_total, opt);
	        
	        }
	        
	        else {
	        	
	        	achieved[i] = false;
	        }
		
		} 

		
		
		
		return achieved;
		
		
	}
}
