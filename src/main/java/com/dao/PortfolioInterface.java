package com.dao;

import com.pojo.*;

public interface PortfolioInterface {
	
	PortfolioPoint generateFrontier(double equityExpectedReturn, double equityVolatility, double bondExpectedReturn, double bondVolatility, double goldExpectedReturn, double goldVolatility, double equityBondcovariance, double equityGoldCovariance, double bondGoldCovariance, double riskFreeRate);
	double calculateRiskyAssetWeight(PortfolioPoint point, double riskAversionCoefficient);

}
