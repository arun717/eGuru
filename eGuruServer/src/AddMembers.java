

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddMembers")
public class AddMembers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMembers() {
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
        String tid = request.getParameter("tb_teamid");
        String memid = request.getParameter("tb_memid");
        String memname = request.getParameter("tb_memname");
        String imgurl = request.getParameter("tb_url");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eguru", "root", "");
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO teammemberdetails(MemberID, MemberName, TeamID, ImageUrl, Status) VALUES (?,?,?,?,?)");
            ps.setString(1, memid);
            ps.setString(2, memname);
            ps.setString(3, tid);
            ps.setString(4, "images/profile.jpg");
            ps.setString(5, "online");

 
            int i = ps.executeUpdate();
            if (i > 0)
                //out.print("\n\nYou are successfully registered...Go check your data in MYSQL database now...\n");
            	response.sendRedirect("MemberAddedSuccess.jsp");
            else
            	out.print("SOME error occurred here !!!");
 
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();


	}
	

}
