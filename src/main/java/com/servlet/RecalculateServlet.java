package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CashFlow;
import com.beans.GoalsMap;
import com.beans.OptimumPoint;
import com.beans.RiskCalc;
import com.beans.TotalReturns;
import com.dao.PortfolioInterface;
import com.dao.personalDAO;
import com.dao.impl.PortfolioPointImpl;
import com.dao.impl.personalDAOImpl;
import com.pojo.PortfolioPoint;
import com.pojo.personalInfo;

/**
 * Servlet implementation class RecalculateServlet
 */
@WebServlet(name="RecalculateServlet", displayName="Recalculate Servlet", urlPatterns = {"/recalculate"})
public class RecalculateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecalculateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String emailid = (String) request.getSession().getAttribute("session_email");
		personalDAOImpl p = new personalDAOImpl();
		float arr[] = p.getIncome(emailid);
		float income = arr[0];
		float expenditure = arr[1];
		
		
		//getting portfolio details
		
		double port_total = p.getPort_Total(emailid);
		
		//getting points from questions
        int []years = p.getYears(emailid);
        double[] goals = p.getGoals(emailid);
        String[] goalType = p.getType(emailid);
		int goalNum = years.length;
      
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
		
		PortfolioInterface impl = new PortfolioPointImpl();
		PortfolioPoint opt = new PortfolioPoint();	
		
		opt = OptimumPoint.findPoint();		
		double risk_aversion = Double.parseDouble(request.getParameter("myRange"));
		double riskyAssetWeight = impl.calculateRiskyAssetWeight(opt, risk_aversion);
        double riskFreeAssetWeight = 1- riskyAssetWeight;
        
        GoalsMap g = new GoalsMap();
		CashFlow [] flow = new CashFlow[years[goalNum-1]];
        
		
        boolean [] check = g.GoalCheck(years,(double[]) expected, riskyAssetWeight, opt,port_total,(double) income, (double) expenditure,flow);

        request.setAttribute("check", check);
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
		//yearly_returns[0]=0;
		for(int i=0;i<years[goalNum-1];i++)
		{
//			yearly_returns[i]=TotalReturns.getTotalReturns(port_total,flow, i, goals, years, check, income, expenditure);
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
