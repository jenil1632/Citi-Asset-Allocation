package com.beans;

import java.util.ArrayList;
import java.util.List;

import com.pojo.PortfolioPoint;



public class AllocateAssets {

	private static double riskyWeight;
	private double [] randomReturn = new double [4];
	
	
	
	


	public double[] getRandomReturn() {
		return randomReturn;
	}

	public double[] cashFlow(double surplus, PortfolioPoint currentP, double holdings_total, double riskyAssetWeight) {

		riskyWeight = riskyAssetWeight;
		double[] allocations = new double[4]; 

		randomReturn = FutureReturns.getFutureReturns(8, 12, 3.7, 3.5, 15, 30);
		
		//Add Surplus
		holdings_total= holdings_total+surplus;		

		
		
		//Calculate Return
		for(int i=0;i<4;i++) {
			
			if(i == 0)holdings_total = holdings_total*(1+0.01*randomReturn[i]*currentP.getBondWeight()*riskyAssetWeight);
			else if(i==1)holdings_total = holdings_total*(1+0.01*randomReturn[i]*currentP.getEquityWeight()*riskyAssetWeight);
			else if(i==2)holdings_total = holdings_total*(1+0.01*randomReturn[i]*currentP.getGoldWeight()*riskyAssetWeight);
			else if(i==3)holdings_total = holdings_total*(1+0.01*randomReturn[i]*(1-riskyAssetWeight));
			
			
		}
 
		
		//Split Up Assets
		for(int i=0;i<4;i++) {
			if(i == 0)allocations[i] = holdings_total*currentP.getBondWeight()*riskyAssetWeight;
			else if(i==1)allocations[i] = holdings_total*currentP.getEquityWeight()*riskyAssetWeight;
			else if(i==2)allocations[i] = holdings_total*currentP.getGoldWeight()*riskyAssetWeight;
			else if(i==3)allocations[i] = holdings_total*(1-riskyAssetWeight);
			
		}
		
		
		return allocations;
	}
	
	public static double[] splitUP(double holdings_total,PortfolioPoint currentP) {
		
		
		double[] allocations = new double[4]; 
		
		for(int i=0;i<4;i++) {
			if(i == 0)allocations[i] = holdings_total*currentP.getBondWeight()*riskyWeight;
			else if(i==1)allocations[i] = holdings_total*currentP.getEquityWeight()*riskyWeight;
			else if(i==2)allocations[i] = holdings_total*currentP.getGoldWeight()*riskyWeight;
			else if(i==3)allocations[i] = holdings_total*(1-riskyWeight);
			
		}

		return allocations;
	}

}

