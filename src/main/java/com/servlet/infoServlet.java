package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.CashFlow;
import com.beans.GoalsMap;
import com.beans.OptimumPoint;
import com.beans.RiskCalc;
import com.beans.RiskScorePersonal;
import com.beans.RiskScorePortfolio;
import com.beans.RiskScoreQuestions;
import com.beans.TotalReturns;
import com.dao.PortfolioInterface;
import com.dao.personalDAO;
import com.dao.impl.PortfolioPointImpl;
import com.dao.impl.personalDAOImpl;
import com.pojo.PortfolioPoint;
import com.pojo.personalInfo;

/**
 * Servlet implementation class infoServlet
 */
@WebServlet(name="infoServlet", displayName="info Servlet", urlPatterns = {"/info"})
public class infoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		//getting personal info
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		float income = Float.parseFloat(request.getParameter("income"));
		float expenditure = Float.parseFloat(request.getParameter("expenditure"));
		int fin_dep = Integer.parseInt(request.getParameter("dependnum"));
		String emailid = (String) request.getSession().getAttribute("session_email");
	
		
		//getting portfolio details
		int val = Integer.parseInt(request.getParameter("invest"));
		float stocks= 0;
		float bonds=0;
		float commodities=0;
		float deposits=0;
		if(val == 5 || val == 7)
		{
		 stocks = Float.parseFloat(request.getParameter("stocks"));
		 bonds = Float.parseFloat(request.getParameter("bonds"));
		 commodities = Float.parseFloat(request.getParameter("commodities"));
		 deposits = Float.parseFloat(request.getParameter("deposits"));
		
		}
		
		double port_total = stocks+bonds+deposits+commodities;
		
		//getting points from questions
		int value = Integer.parseInt(request.getParameter("invest1"));
		int value1 = Integer.parseInt(request.getParameter("invest2"));
		int value2 = Integer.parseInt(request.getParameter("invest3"));
		int value3 = Integer.parseInt(request.getParameter("invest4"));
		int value4 = Integer.parseInt(request.getParameter("invest5"));
		int value5 = Integer.parseInt(request.getParameter("invest6"));
		int value6 = Integer.parseInt(request.getParameter("invest7"));
		
		personalInfo per = new personalInfo(name, age, income, expenditure, fin_dep);
		personalDAO dao = new personalDAOImpl();
		
		int goalNum = Integer.parseInt(request.getParameter("important"));
        int []years = new int[goalNum];
        double[] goals = new double[goalNum];
        String[] goalType = new String[goalNum];
      
		for(int i=0; i < goalNum; i++) {
			goalType[i] = request.getParameter("goal_type"+(i+1));
			goals[i] = Double.parseDouble(request.getParameter("assets"+(i+1)));
			years[i] = Integer.parseInt(request.getParameter("year"+(i+1)));
			dao.addGoals(goalType[i], goals[i], years[i], emailid);
		}
		
		
		int temp = 0;
		String temp2=null; 
		double temp1 = 0;
        for(int i=0; i < goalNum; i++){  
                for(int j=1; j < (goalNum-i); j++){  
                         if(years[j-1] > years[j]){  
                                //swap elements  
                                temp = years[j-1];  
                                years[j-1] = years[j];  
                                years[j] = temp;
                                
                                temp1 = goals[j-1];
                                goals[j-1] = goals[j];
                                goals[j] = temp1;
                                
                                temp2 = goalType[j-1];
                                goalType[j-1] = goalType[j];
                                goalType[j] = temp2;
                        }  
                         
                }  
        }
        double [] expected = new double[goalNum];
        System.arraycopy(goals, 0, expected, 0, goalNum); 
		for(int i=0;i<goalNum;i++) {
			for(int j=0;j<years[i];j++) {
				expected[i]=expected[i]+expected[i]*0.03f;
			}
			expected[i] = Math.round(expected[i]*100)/100.0;
		}

		
		
		
		int[] points = new int[] {value, value1, value2, value3, value4, value5, value6,val};
		int[] weights = new int[]{1, 1, 1, 1, 1, 1, 1,1};
		
		PortfolioInterface impl = new PortfolioPointImpl();
		RiskCalc calc = new RiskCalc();
		PortfolioPoint opt = new PortfolioPoint();	
		
		opt = OptimumPoint.findPoint();		
		double risk_aversion = calc.calculateRisk(age, fin_dep, deposits, bonds, stocks, commodities, points, weights);
        
		
		
		double riskyAssetWeight = impl.calculateRiskyAssetWeight(opt, risk_aversion);
        double riskFreeAssetWeight = 1- riskyAssetWeight;
        
        GoalsMap g = new GoalsMap();
		CashFlow [] flow = new CashFlow[years[goalNum-1]];
        
		
        boolean [] check = g.GoalCheck(years,(double[]) expected, riskyAssetWeight, opt,port_total,(double) income, (double) expenditure,flow);

        request.setAttribute("check", check);

        
		int rows = dao.addPersonal(per, emailid);
		int rows1 = dao.addWeights(value,value1, value2, value3, value4, value5, value6, emailid);
		int rows2 = dao.addPortfolio(val, stocks, bonds, commodities, deposits, emailid);
		request.setAttribute("risky", riskyAssetWeight);
		request.setAttribute("tbills", riskFreeAssetWeight*100);
		request.setAttribute("equity", opt.getEquityWeight()*100);
		request.setAttribute("bonds", opt.getBondWeight()*100);
		request.setAttribute("commodities", opt.getGoldWeight()*100);
		request.setAttribute("sharpe", opt.getSharpeRatio());
		request.setAttribute("standardDeviation", opt.getPortfolioVolatility()/100);
		request.setAttribute("riskAversion", risk_aversion);
		request.setAttribute("cashFlow", flow);
		request.setAttribute("lastYear", years[goalNum-1]);
		request.setAttribute("goalNum", goalNum);
		request.setAttribute("goalType", goalType);
		request.setAttribute("goals", goals);
		request.setAttribute("years", years);
		request.setAttribute("expected", expected);
		double[] yearly_returns = new double[years[goalNum-1]];
		for(int i=0;i<years[goalNum-1];i++)
		{
			yearly_returns[i]=TotalReturns.getTotalReturns(port_total,flow, i, expected, years, check, income, expenditure);

		}
		request.setAttribute("yearly_returns", yearly_returns);
		double [][] assetClassReturn =g.getAssetReturn();
		request.setAttribute("allAssetClassReturns", assetClassReturn);
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<body>");
		RequestDispatcher dispatcher = request.getRequestDispatcher("template/dash.jsp");
		dispatcher.forward(request, response);
		
		writer.println("</body>");
		writer.println("</html>");
	}

}
