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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class deposit
 */
public class withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public withdraw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PreparedStatement p = null;
		ResultSet r = null;
		int balance = 0;
		String id= null;
		
		LocalDateTime datetime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = datetime.format(formatter);
		
		
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM_WEB_PROJECT","root","noWS@#94");
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			request.setAttribute("name",name);
			request.setAttribute("number",number);
			String amt = request.getParameter("deposit1");
			
			p = c.prepareStatement("select id from account where account_number=?");
			p.setString(1, number);
			r = p.executeQuery();
			while(r.next()){
				id = r.getString(1);
			}
			
			
			int rs = 0;
			if (amt == null || amt.isEmpty()) {
		            request.setAttribute("success", "Please enter the amount");
		            RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
		            rd.forward(request, response);
		    }
			if(amt.length()>0){
				int amount = Integer.parseInt(amt);
				p = c.prepareStatement("select balance from account where account_number = ?");
				p.setString(1, number);
				r = p.executeQuery();
				while(r.next()) {
					balance = r.getInt(1);
					if(balance>=amount) {
						p = c.prepareStatement("update account set balance=?-? where account_number=?");
						p.setInt(1, balance);
						p.setInt(2, amount);
						p.setString(3, number);
						rs = p.executeUpdate();
						
						p=c.prepareStatement("select balance from account where account_number=?");
						p.setString(1, number);
						r=p.executeQuery();
						while(r.next()) {
							balance = r.getInt(1);
						}
						
						
						if(rs>0) {
							p = c.prepareStatement("insert into transaction values(?,?,?,'DEBIT',?)");
							p.setString(1, formattedDateTime);
							p.setString(2, id);
							p.setInt(3, amount);
							p.setInt(4, balance);
							rs=0;
							rs = p.executeUpdate();
							if(rs>0) {
								request.setAttribute("success", "Withdraw Successfully");
								RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
								rd.forward(request, response);
							}
							else {
								request.setAttribute("success", "Withdraw Successfull but Transaction not Registered");
								RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
								rd.forward(request, response);
							}
						}
						else {
							request.setAttribute("success", "Withdraw Failed");
							RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
							rd.forward(request, response);
						}
					
					}
					else {
						request.setAttribute("success", "Insufficient balance");
						RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
						rd.forward(request, response);
						
					}
					
				}
			}
			else {
				request.setAttribute("success", "Withdraw Failed");
				RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
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
