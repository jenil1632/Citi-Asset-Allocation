package com.beans;

import java.io.IOException;

import org.apache.commons.math.stat.descriptive.moment.StandardDeviation;

public class CalculateReturnsAndVolatility {
	
	public CalculateReturnsAndVolatility() {
		// TODO Auto-generated constructor stub
	}
	
	public double[] calculateReturnAndVolatility(String bucketSize, double[] returns)throws IOException
    {
		double[] returnAndVolatility = new double[2];
        int annualizationFactor = 1;
        if(bucketSize.equalsIgnoreCase("week"))
        {
            annualizationFactor = 52;
        }
        else if(bucketSize.equalsIgnoreCase("day"))
        {
            annualizationFactor = 252;
        }
        else if(bucketSize.equalsIgnoreCase("month"))
        {
            annualizationFactor = 12;
        }
        double expectedReturn = 0;
        for(int i=0;i<returns.length;i++)
        {
            expectedReturn += returns[i];
        }
        expectedReturn = expectedReturn*annualizationFactor*100.0/returns.length;
        StandardDeviation sd = new StandardDeviation();
        double volatility = sd.evaluate(returns)*100.0*Math.sqrt(annualizationFactor);
        returnAndVolatility[0] = expectedReturn;
        returnAndVolatility[1] = volatility;
        return returnAndVolatility;
    }

}

