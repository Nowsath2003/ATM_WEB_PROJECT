package javafile;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class loginpage
 */
public class loginpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginpage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PreparedStatement p = null;
		ResultSet rs = null;
		String name = null, acc_num = null;
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM_WEB_PROJECT","root","noWS@#94");
			String username = request.getParameter("username");
			String password = request.getParameter("pass");
			
			p = c.prepareStatement("select * from user where id=? ");
			p.setString(1, username);
			rs = p.executeQuery();
			if(rs.next()) {
				p = c.prepareStatement("select * from user where id=? and pin=?");
				p.setString(1, username);
				p.setString(2, password);
				rs = p.executeQuery();
				if(rs.next()) {
					p = c.prepareStatement("select name from user where id =?");
					p.setString(1, username);
					rs = p.executeQuery();
					while(rs.next()) {
						name = rs.getString(1);
					}
					
					p = c.prepareStatement("select account_number from account where id =?");
					p.setString(1, username);
					rs = p.executeQuery();
					while(rs.next()) {
						acc_num = rs.getString(1);
					}
					
					request.setAttribute("name", name);
					request.setAttribute("number", acc_num);
					RequestDispatcher rd = request.getRequestDispatcher("transaction.jsp");
					rd.forward(request, response);
				}
				else {
					request.setAttribute("error", "**INCORRECT PASSWORD**");
					RequestDispatcher rd = request.getRequestDispatcher("loginpage.jsp");
	                rd.forward(request, response);
				}
			}
			else{
				request.setAttribute("error", "**NO USER FOUND**");
				RequestDispatcher rd = request.getRequestDispatcher("loginpage.jsp");
                rd.forward(request, response);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
