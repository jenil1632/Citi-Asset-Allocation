package com.pojo;

public class personalInfo {
	
	private String name;
	private int age;
	private float income;
	private float expenditure;
	private int fin_dep;

	public personalInfo(String name, int age, float income, float expenditure, int fin_dep) {
		super();
		this.name = name;
		this.age = age;
		this.income = income;
		this.expenditure = expenditure;
		this.fin_dep = fin_dep;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public float getIncome() {
		return income;
	}

	public void setIncome(float income) {
		this.income = income;
	}

	public float getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(float expenditure) {
		this.expenditure = expenditure;
	}

	public int getFin_dep() {
		return fin_dep;
	}

	public void setFin_dep(int fin_dep) {
		this.fin_dep = fin_dep;
	}

	public personalInfo() {
		// TODO Auto-generated constructor stub
	}

}
