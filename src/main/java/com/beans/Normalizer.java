package com.beans;

public class Normalizer {

	private double risk_aversion;
	
	public double getRisk_aversion() {
		return risk_aversion;
	}


	public void calculateRiskAversion(double risk_score) {
		risk_aversion = ((risk_score*risk_score*Math.log10(risk_score))*0.5 )+10;
		
	}
}
