package com.dao.impl;

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connections.MyConnection;
import com.dao.personalDAO;
import com.pojo.personalInfo;

public class personalDAOImpl implements personalDAO {

	@Override
	public int addPersonal(personalInfo per, String emailid) {
		// TODO Auto-generated method stub
        int rowsAdded = 1;
		
		String  ADD_PERSONAL="INSERT INTO PERSONAL_INFO VALUES(?,?,?,?,?,?)";
		try {
			Connection con = MyConnection.openConnection();
			PreparedStatement ps = con.prepareStatement(ADD_PERSONAL);
			ps.setString(1, emailid);
			ps.setString(2, per.getName());
			ps.setInt(3, per.getAge());
			ps.setFloat(4, per.getIncome());
			ps.setFloat(5, per.getExpenditure());
			ps.setInt(6, per.getFin_dep());
			
			rowsAdded = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rowsAdded;
	}

	@Override
	public int addWeights(int q1, int q2, int q3, int q4, int q5, int q6, int q7, String emailid) {
		// TODO Auto-generated method stub
        int rowsAdded = 0;
		
		String  ADD_WEIGHTS="INSERT INTO QUESTIONAIRE VALUES(?,?,?,?,?,?,?,?)";
		try {
			Connection con = MyConnection.openConnection();
			PreparedStatement ps = con.prepareStatement(ADD_WEIGHTS);
			ps.setString(1, emailid);
			ps.setInt(2, q1);
			ps.setInt(3, q2);
			ps.setFloat(4, q3);
			ps.setFloat(5, q4);
			ps.setInt(6, q5);
			ps.setInt(7, q6);
			ps.setInt(8, q7);
			
			rowsAdded = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rowsAdded;
	}

	@Override
	public int addPortfolio(int inv_ex, float stocks, float bonds, float gold, float deposits, String emailid) {
		// TODO Auto-generated method stub
		 int rowsAdded = 0;
			
			String  ADD_PORTFOLIO="INSERT INTO PORTFOLIO VALUES(?,?,?,?,?,?)";
			try {
				Connection con = MyConnection.openConnection();
				PreparedStatement ps = con.prepareStatement(ADD_PORTFOLIO);
				ps.setString(1, emailid);
				ps.setInt(2, inv_ex);
				ps.setFloat(3, stocks);
				ps.setFloat(4,bonds);
				ps.setFloat(5, gold);
				ps.setFloat(6, deposits);
				
				
				rowsAdded = ps.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return rowsAdded;
	}

	@Override
	public int addGoals(String goal_type, double current_price, int time, String emailid) {
		// TODO Auto-generated method stub
        int rowsAdded = 0;
		
		String  ADD_PERSONAL="INSERT INTO GOALS VALUES(?,?,?,?)";
		try {
			Connection con = MyConnection.openConnection();
			PreparedStatement ps = con.prepareStatement(ADD_PERSONAL);
			ps.setString(1, emailid);
			ps.setString(2, goal_type);
			ps.setDouble(3, current_price);
			ps.setInt(4, time);
			
			rowsAdded = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rowsAdded;
	}

	@Override
	public float[] getIncome(String emailid) {
		// TODO Auto-generated method stub
		float[] details = new float[2];
		String FIND_INCOME = "SELECT income, expenditure FROM personal_info WHERE emailid = ?";
		try(Connection con = MyConnection.openConnection()) {
			
			PreparedStatement ps = con.prepareStatement(FIND_INCOME);
			ps.setString(1, emailid);
			ResultSet set = ps.executeQuery();
			while(set.next()) {
				details[0]= set.getFloat("income");
				details[1]= set.getFloat("expenditure");
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			}
		return details;
	}

	@Override
	public float getPort_Total(String emailid) {
		// TODO Auto-generated method stub
		String FIND_TOTAL = "SELECT stocks, bonds, gold, deposits FROM portfolio WHERE emailid = ?";
		float total=0;
		try(Connection con = MyConnection.openConnection()) {
			
			PreparedStatement ps = con.prepareStatement(FIND_TOTAL);
			ps.setString(1, emailid);
			ResultSet set = ps.executeQuery();
			while(set.next()) {
				float stocks= set.getFloat("stocks");
				float gold= set.getFloat("gold");
				float deposits= set.getFloat("deposits");
				float bonds= set.getFloat("bonds");
				total=bonds+gold+deposits+stocks;
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			}
		return total;
	}

	@Override
	public int[] getYears(String emailid) {
		// TODO Auto-generated method stub
		List<Integer> y = new ArrayList<>();
		String FIND_YEARS="SELECT bytime FROM goals WHERE emailid = ?";
		try(Connection con = MyConnection.openConnection()) {
			
			PreparedStatement ps = con.prepareStatement(FIND_YEARS);
			ps.setString(1, emailid);
			ResultSet set = ps.executeQuery();
			while(set.next()) {
				int year= set.getInt("bytime");
				y.add(year);
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			}
		int[] arr = y.stream().mapToInt(i -> i).toArray();
		return arr;
	}

	@Override
	public double[] getGoals(String emailid) {
		// TODO Auto-generated method stub
		List<Double> g = new ArrayList<>();
		String FIND_GOALS="SELECT currentprice FROM goals WHERE emailid = ?";
		try(Connection con = MyConnection.openConnection()) {
			
			PreparedStatement ps = con.prepareStatement(FIND_GOALS);
			ps.setString(1, emailid);
			ResultSet set = ps.executeQuery();
			while(set.next()) {
				double current = set.getDouble("currentprice");
				g.add(current);
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			}
		double[] arr = g.stream().mapToDouble(i -> i).toArray();
		return arr;	
		}

	@Override
	public String[] getType(String emailid) {
		// TODO Auto-generated method stub
		List<String> t = new ArrayList<>();
		String FIND_TYPE="SELECT goaltype FROM goals WHERE emailid = ?";
		try(Connection con = MyConnection.openConnection()) {
			
			PreparedStatement ps = con.prepareStatement(FIND_TYPE);
			ps.setString(1, emailid);
			ResultSet set = ps.executeQuery();
			while(set.next()) {
				String type = set.getString("goaltype");
				t.add(type);
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			}
		String [] goaltype = t.toArray(new String[t.size()]);
		return 	goaltype;
		}

}
