

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

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class AddTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeam() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("tb_teamid");
        String name = request.getParameter("tb_name");
        String url = request.getParameter("tb_url");

 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eguru", "root", "");
 
            PreparedStatement ps = con.prepareStatement("insert into teamdetails values(?,?,?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, url);

 
            int i = ps.executeUpdate();
            if (i > 0)
                //out.print("\n\nYou are successfully registered...Go check your data in MYSQL database now...\n");
            	response.sendRedirect("teamAddedSuccess.jsp");
            else
            	out.print("SOME error occurred here !!!");
 
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
	}

}
