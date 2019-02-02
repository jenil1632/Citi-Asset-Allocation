package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.dao.impl.UserDAOImpl;
import com.pojo.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(name="RegisterServlet", displayName="Register Servlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String password = request.getParameter("pass");
		String username = request.getParameter("username");		
		String email = request.getParameter("email");
		User user = new User(email, username, password);
		
		UserDAO dao = new UserDAOImpl();
		int row = dao.addUser(user);
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<body>");
		request.setAttribute("registered", "yes");
		if(row > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("session_email", email);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
			dispatcher.forward(request, response);
		}
		writer.println("</body>");
		writer.println("</html>");
		
	}

}
