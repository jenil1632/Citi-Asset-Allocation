package com.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class emailServlet
 */
@WebServlet(name="emailServlet", displayName="email Servlet", urlPatterns = {"/email"})
public class emailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String tbills = request.getParameter("t-bills");
		String equities = request.getParameter("equities");
		String bonds = request.getParameter("bonds");
		String commodities = request.getParameter("commodities");
		String email = (String)session.getAttribute("session_email");
		System.out.println(tbills);
		System.out.println(equities);
        ProcessBuilder builder = new ProcessBuilder(
            "cmd.exe", "/c", "C:\\Python27\\python.exe C:\\Python27\\EmailOL.py "+email+" "+bonds+" "+equities+" "+commodities+" "+tbills);
        builder.redirectErrorStream(true);
        Process p = builder.start();
        BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String line;
        while (true) {
            line = r.readLine();
            if (line == null) { break; }
            System.out.println(line);
	}
        session.invalidate();
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);

}
}
