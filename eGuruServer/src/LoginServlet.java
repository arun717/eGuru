

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();	
		out.println("<html><body>");
		out.println("<h3>Hello this is my first servlet</h3>");
		out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String role = request.getParameter("userType");
        String username = request.getParameter("txt_usr");
        String password = request.getParameter("txt_pwd");
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eguru", "root", "");
 
            if(role.equalsIgnoreCase("Student"))
            {
	            PreparedStatement ps = con.prepareStatement("SELECT * FROM studentlogin WHERE Uname=? AND Pass=?");            
	            ps.setString(1, username);
	            ps.setString(2, password);
	            ResultSet rs = (ResultSet) ps.executeQuery();
	            boolean st = rs.next();
	            if (st)
	            {
	            	//get the old session and invalidate
	            	HttpSession oldSession = request.getSession(false);
	                if (oldSession != null) {
	                    oldSession.invalidate();
	                }
	                //generate a new session
	                HttpSession newSession = request.getSession(true);

	                //setting session to expiry in 5 mins
	                newSession.setMaxInactiveInterval(5*60);
	                
	                Cookie message = new Cookie("message", "Welcome");
	                response.addCookie(message);
	            	
	            	response.sendRedirect("Welcome.jsp");
	            }
	            else
	            {
	            	response.sendRedirect("loginWithError.jsp");
	            }
            }
            else if(role.equalsIgnoreCase("Teacher"))
            {
            	PreparedStatement ps = con.prepareStatement("SELECT * FROM teacherlogin WHERE Uname=? AND Pass=?");            
	            ps.setString(1, username);
	            ps.setString(2, password);
	            ResultSet rs = (ResultSet) ps.executeQuery();
	            boolean st = rs.next();
	            if (st)
	            	response.sendRedirect("teacherWelcome.jsp");
	            else
	            {
	            	response.sendRedirect("loginWithError.jsp");
	            }
            	
            }
            else if(role.equalsIgnoreCase("Other"))
            {
            	PreparedStatement ps = con.prepareStatement("SELECT * FROM otherlogin WHERE Uname=? AND Pass=?");            
	            ps.setString(1, username);
	            ps.setString(2, password);
	            ResultSet rs = (ResultSet) ps.executeQuery();
	            boolean st = rs.next();
	            if (st)
	            	response.sendRedirect("Welcome.jsp");
	            else
	            {
	            	response.sendRedirect("loginWithError.jsp");
	            }
            	
            }
            else
            {
            	response.sendRedirect("loginWithError.jsp");
            }
 
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
        
	}

}
