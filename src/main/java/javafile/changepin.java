package javafile;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class changepin
 */
public class changepin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changepin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PreparedStatement p = null;
		ResultSet rs = null;
		PrintWriter out = response.getWriter();
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM_WEB_PROJECT","root","noWS@#94");
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			request.setAttribute("name",name);
			request.setAttribute("number",number);
			
			String oldpin = request.getParameter("oldpin");
			String newpin = request.getParameter("newpin");
			String newpin2 = request.getParameter("newpin2");
			
			int np = Integer.parseInt(newpin);
			int np2 = Integer.parseInt(newpin2);
			p = c.prepareStatement("select pin from user where id= (select id from account where account_number=?);");
			p.setString(1, number);
			rs = p.executeQuery();
			while(rs.next()) {
				int op = Integer.parseInt(oldpin);
				int op2 = rs.getInt(1);
				if(op==op2) {
					if(np == np2 ) {
						
						if(np != op) {
							
							p = c.prepareStatement("update user set pin =? where id=(select id from account where account_number=?);");
							p.setInt(1, np);
							p.setString(2, number);
							int r=p.executeUpdate();
							if(r>0) {
								out.println("<script type=\"text/javascript\">");
				                out.println("alert('Pin changed Successfully');");
				                out.println("alert('You can login again');");
				                out.println("window.location.href = 'loginpage.jsp';");
				                out.println("</script>");
							}
							else {
								request.setAttribute("success","**Pin changed Failed**");
								RequestDispatcher rd = request.getRequestDispatcher("changepin.jsp");
								rd.forward(request, response);
							}
					
						}
						else {
							request.setAttribute("success","**New Pin cannot be Old Pin**");
							RequestDispatcher rd = request.getRequestDispatcher("changepin.jsp");
							rd.forward(request, response);
						}
						
					}
					else {
						request.setAttribute("success","***Mismatched New Pin***");
						RequestDispatcher rd = request.getRequestDispatcher("changepin.jsp");
						rd.forward(request, response);
					}
				}
				else {
					request.setAttribute("success","***Incorrect Pin***");
					RequestDispatcher rd = request.getRequestDispatcher("changepin.jsp");
					rd.forward(request, response);
					
				}
			
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
