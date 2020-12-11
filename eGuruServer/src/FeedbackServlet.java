

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FeedbackServlet
 */
@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("fb_uname");
        String entity = request.getParameter("fb_entity");
        String feed = request.getParameter("userfeedback");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eguru", "root", "");
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO feedback( Uname, Entity, Feedback) VALUES(?,?,?)");
            ps.setString(1, uname);
            ps.setString(2, entity);
            ps.setString(3, feed);

 
            int i = ps.executeUpdate();
            if (i > 0)
                //out.print("\n\nYou are successfully registered...Go check your data in MYSQL database now...\n");
            	response.sendRedirect("feedbackSuccess.jsp");
            else
            	out.print("SOME error occurred here !!!");
 
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();


	}

}
