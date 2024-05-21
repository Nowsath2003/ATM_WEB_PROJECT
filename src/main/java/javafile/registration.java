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
import java.util.Random;

/**
 * Servlet implementation class registration
 */
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		PreparedStatement p =null;
		ResultSet rs = null;
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM_WEB_PROJECT","root","noWS@#94");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String ph_num = request.getParameter("ph_num");
			String education = request.getParameter("education");
			String occupation = request.getParameter("occupation");
			String dob = request.getParameter("dob");
			String city = request.getParameter("city");
			String pincode = request.getParameter("pincode");
			String pin = request.getParameter("pin");
			
			p = c.prepareStatement("select * from user where id=?");
			p.setString(1, id);
			rs = p.executeQuery();
			if(!rs.next()) {
				p = c.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?)");
				p.setString(1, id);
				p.setString(2, name);
				p.setString(3, age);
				p.setString(4, ph_num);
				p.setString(5, education);
				p.setString(6, occupation);
				p.setString(7, dob);
				p.setString(8, city);
				p.setString(9, pincode);
				p.setString(10, pin);
				
				int r = p.executeUpdate();
				if(r>0) {
					Random random = new Random();
					int account_no = random.nextInt(9999999-1000000+1)+1;
					
					p= c.prepareStatement("select * from account where account_number = ?");
					p.setInt(1, account_no);
					rs = p.executeQuery();
					if(rs.next()) {
						doGet(request, response);
					}
					else {
						p = c.prepareStatement("insert into account values(?,?,0)");
		                p.setString(1, id);
		                p.setInt(2, account_no);
		                r = p.executeUpdate();
		                if(r>0){
		                	out.println("<script type=\"text/javascript\">");
			                out.println("alert('YOU CAN LOGIN NOW');");
			                out.println("window.location.href = 'loginpage.jsp';");
			                out.println("</script>");
		                }
		                else {
							RequestDispatcher rd = request.getRequestDispatcher("fail.jsp");
							rd.forward(request, response);
						}
					}
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("fail.jsp");
					rd.forward(request, response);
				}  
			}
			else {
				request.setAttribute("error", "**ID ALREADY EXIST**");
				RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");
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
