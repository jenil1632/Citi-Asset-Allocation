package com.testing;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.dao.impl.UserDAOImpl;
import com.dao.impl.personalDAOImpl;
import com.pojo.User;
import com.pojo.personalInfo;

class TestpersonalDAOImpl {


//	@Test
//	void testAddPersonalDAOImpl_Positive() {
//		personalDAOImpl dao= new personalDAOImpl();
//		int expected = 1;
//		personalInfo per = new personalInfo("Mridula", 21, 140000, 35000, 0);
//		int act_res = dao.addPersonal(per, "abc@gmail.com");
//		assertEquals(expected, act_res);
//	}
//	
//	@Test
//	void testAddPersonalDAOImpl_Negative() {
//		personalDAOImpl dao= new personalDAOImpl();
//		int expected = 0;
//		personalInfo per = new personalInfo("Mridula", 21, 140000, 35000, 0);
//		int act_res = dao.addPersonal(per, "abc@gmail.com");
//		assertEquals(expected, act_res);
//		
//	}
	
//	@Test
//	void testPointsPersonalDAOImpl_Positive()
//	{
//		personalDAOImpl dao= new personalDAOImpl();
//		int expected = 1;
//		int act_res = dao.addWeights(9, 3, 2, 1, 8, 9, 1, "abc@gmail.com");
//		assertEquals(expected, act_res);
//	}
//	
//	@Test
//	void testPointsPersonalDAOImpl_Negative()
//	{
//		personalDAOImpl dao= new personalDAOImpl();
//		int expected = 0;
//		int act_res = dao.addWeights(9, 3, 2, 1, 8, 9, 1, "abc@gmail.com");
//		assertEquals(expected, act_res);
//	}
	
	@Test
	void testPortfolioPersonalDAOImpl_Positive() {
		personalDAOImpl dao= new personalDAOImpl();
		int expected = 1;
		int act_res = dao.addPortfolio(4, 45, 9, 32, 8, "abc@gmail.com");
		assertEquals(expected, act_res);
	}
	
	@Test
	void testPortfolioPersonalDAOImpl_Negative() {
		personalDAOImpl dao= new personalDAOImpl();
		int expected = 0;
		int act_res = dao.addPortfolio(4, 45, 9, 32, 8, "abc@gmail.com");
		assertEquals(expected, act_res);
		
	}
//	
	

}
