package com.dao.impl;

import com.pojo.*;
import com.dao.PortfolioInterface;

public class PortfolioPointImpl implements PortfolioInterface{

	@Override
	public PortfolioPoint generateFrontier(double equityExpectedReturn, double equityVolatility,
			double bondExpectedReturn, double bondVolatility, double goldExpectedReturn, double goldVolatility,
			double equityBondcovariance, double equityGoldCovariance, double bondGoldCovariance, double riskFreeRate) {
		// TODO Auto-generated method stub
		PortfolioPoint opt = new PortfolioPoint();
        for(double i=0;i<=1;i+=0.001)
        {
            double equityWeight = i;
            for(double j=0;j<=(1-i);j+=0.001)
            {
                double bondWeight = j;
                double goldWeight = 1.0 - i - j;
                double portfolioReturn = equityWeight*equityExpectedReturn + bondWeight*bondExpectedReturn + goldWeight*goldExpectedReturn;
                double portfolioVariance = Math.pow((equityVolatility*equityWeight), 2) + Math.pow((bondVolatility*bondWeight), 2) + Math.pow((goldVolatility*goldWeight), 2) + 2*bondWeight*equityWeight*equityBondcovariance + 2*equityWeight*goldWeight*equityGoldCovariance + 2*bondWeight*goldWeight*bondGoldCovariance;
                double sharpeRatio = (portfolioReturn - riskFreeRate)/Math.sqrt(portfolioVariance);
                if(opt.getSharpeRatio()<=sharpeRatio)
                {
                    opt = new PortfolioPoint(equityWeight, bondWeight, goldWeight, portfolioReturn, Math.sqrt(portfolioVariance), sharpeRatio);
                }
            }
        }
        return opt;
	}

	@Override
	public double calculateRiskyAssetWeight(PortfolioPoint point, double riskAversionCoefficient) {
		// TODO Auto-generated method stub
		double riskyAssetWeight = (point.getSharpeRatio())/((point.getPortfolioVolatility()/100)*riskAversionCoefficient);
        return riskyAssetWeight;
	}
	
	

}
