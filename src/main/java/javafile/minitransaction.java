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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class minitransaction
 */
public class minitransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public minitransaction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<MTransaction> list = new ArrayList();
		
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM_WEB_PROJECT","root","noWS@#94");
			
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			request.setAttribute("name", name);
			request.setAttribute("number", number);
			
			
			PreparedStatement p = c.prepareStatement("select * from transaction where id = (select id from account where account_number = ?) order by time desc");
			p.setString(1, number);
			ResultSet rs = p.executeQuery();
			while(rs.next()) {
				Timestamp time = rs.getTimestamp(1);
				String id = rs.getString(2);
				int amount = rs.getInt(3);
				String type = rs.getString(4);
				int balance = rs.getInt(5);
				
				MTransaction transaction = new MTransaction(time,id,amount,type,balance);
				list.add(transaction);
				
			}
			
			
			request.setAttribute("userList", list);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("minitransaction.jsp");
	        dispatcher.forward(request, response);
			
			
			
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

