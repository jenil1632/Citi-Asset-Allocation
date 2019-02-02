package com.beans;



public class RiskScoreQuestions {

	private double [] ques_score = new double[10];
	private double risk_questions;
	
	
	
	public double[] getQues_score() {
		return ques_score;
	}


	public double getRisk_questions() {
		return risk_questions;
	}


	public void calculateRiskQuestions (int [] points, int [] weights) {
		
		double w_sum = 0;
		
		for(int i=0;i<8;i++) {
			ques_score[i]= points[i]*weights[i];
			w_sum = w_sum+ques_score[i];
		}
		risk_questions = w_sum/8;
		
	}
	
	
	
	
}
