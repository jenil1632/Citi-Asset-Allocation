package com.dao;

import com.pojo.personalInfo;

public interface personalDAO {
	int addPersonal(personalInfo per, String emailid);
	int addWeights(int q1, int q2, int q3, int q4, int q5, int q6, int q7, String emailid);
	int addPortfolio(int inv_ex, float stocks, float bonds, float gold, float deposits, String emailid );
	int addGoals(String goal_type, double current_price, int time, String emailid);
	float[] getIncome(String emailid);
	float getPort_Total(String emailid);
	int[] getYears(String emailid);
	double[] getGoals(String emailid);
	String[] getType(String emailid);
}
