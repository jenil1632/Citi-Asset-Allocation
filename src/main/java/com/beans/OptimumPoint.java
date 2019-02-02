package com.beans;

import java.io.IOException;

import com.dao.impl.PortfolioPointImpl;
import com.pojo.PortfolioPoint;



public class OptimumPoint {
	

	private static PortfolioPoint opt = new PortfolioPoint();
	private double riskyAssetWeight ;
	
	public static PortfolioPoint findPoint() throws IOException { 
		ExtractData e = new ExtractData();
		CalculateReturnsAndVolatility calc = new CalculateReturnsAndVolatility();
		PortfolioPointImpl impl = new PortfolioPointImpl();
		
		double[] equityValues;
		double[] bondValues; 
		double[] commValues = {16,40};
		

      opt = impl.generateFrontier(8, 12, 2.35,3.2, 15,30, -0.16147883741320435, -0.353, -0.34, 2.0);     

      return opt;
	
	}
	
	
	
	
	
      
}
