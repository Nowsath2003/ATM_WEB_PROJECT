package javafile;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
 * Servlet implementation class balance
 */
public class balance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public balance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int balance = 0;
		try {
			
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM_WEB_PROJECT","root","noWS@#94");
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			
			PreparedStatement p = c.prepareStatement("select balance from account where account_number= ?");
			p.setString(1, number);
			ResultSet rs = p.executeQuery();
			while(rs.next()) {
				balance =rs.getInt(1);
				
			}
			request.setAttribute("name",name);
			request.setAttribute("number",number);
			request.setAttribute("balance", balance);
			RequestDispatcher rd = request.getRequestDispatcher("balance.jsp");
			rd.forward(request, response);
			
			
					
					
					
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
