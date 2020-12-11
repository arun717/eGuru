

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
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String type_number = request.getParameter("show_assign_types");

        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eguru", "root", "");
 
            if(type_number.equalsIgnoreCase("1") || (type_number.equalsIgnoreCase("4")))
            {
            	String id_str = request.getParameter("1_4_type_id");
            	int id = Integer.parseInt(id_str);
            	String obj = request.getParameter("1_4_obj");
            	String outcome = request.getParameter("1_4_outcomes");
            	String ques = request.getParameter("1_4_quest");
            	String res = request.getParameter("1_4_res");
            	            	       
	            PreparedStatement ps = con.prepareStatement("INSERT INTO lvl1_4_assig(Assignment_id, Objectives, Outcomes, Questions, Resources) VALUES (?,?,?,?,?)");            
	            ps.setInt(1, id);
	            ps.setString(2, obj);
	            ps.setString(3, outcome);
	            ps.setString(4, ques);
	            ps.setString(5, res);
	            int rs = ps.executeUpdate();
	            
	            if (rs>=0)
	            {	            	
	            	response.sendRedirect("allQuestions.jsp");
	            }
	            
            }
            else if(type_number.equalsIgnoreCase("2"))
            {
            	String id_str = request.getParameter("type2_id");
            	int id = Integer.parseInt(id_str);
            	String preprep = request.getParameter("type2_preprep");
            	String obj = request.getParameter("type2_obj");
            	String outcome = request.getParameter("type2_outcome");
            	String ques = request.getParameter("type2_ques");
            	String res = request.getParameter("type2_res");
            	            	       
	            PreparedStatement ps = con.prepareStatement("INSERT INTO lvl2_tbl_assig(Assignment_id, Prepreparation, Objectives, Outcomes, Questions, Resources) VALUES (?,?,?,?,?,?)");            
	            ps.setInt(1, id);
	            ps.setString(2, preprep);
	            ps.setString(3, obj);
	            ps.setString(4, outcome);
	            ps.setString(5, ques);
	            ps.setString(6, res);
	            int rs = ps.executeUpdate();
	            
	            if (rs>=0)
	            {	            	
	            	response.sendRedirect("allQuestions.jsp");
	            }
            }
            else if(type_number.equalsIgnoreCase("3"))
            {
            	String id_str = request.getParameter("type3_id");
            	int id = Integer.parseInt(id_str);
            	String solo1 = request.getParameter("type3_solo1");
            	String solo2 = request.getParameter("type3_solo2");
            	String solo3 = request.getParameter("type3_solo3");
            	String solo4 = request.getParameter("type3_solo4");
            	String pair1 = request.getParameter("type3_pair1");
            	String pair2 = request.getParameter("type3_pair2");
            	String quad1 = request.getParameter("type3_quad1");      
            	
            	PreparedStatement ps = con.prepareStatement("INSERT INTO lvl3_csd_assig(Assignment_id, Solo_1, Solo_2, Solo_3, Solo_4, Pair_1, Pair_2, Quad_1) VALUES (?,?,?,?,?,?,?,?)");            
	            ps.setInt(1, id);
	            ps.setString(2, solo1);
	            ps.setString(3, solo2);
	            ps.setString(4, solo3);
	            ps.setString(5, solo4);
	            ps.setString(6, pair1);
	            ps.setString(7, pair2);
	            ps.setString(8, quad1);
	            int rs = ps.executeUpdate();
	            
	            if (rs>=0)
	            {	            	
	            	response.sendRedirect("allQuestions.jsp");
	            }
            }
            else
            {
            	response.sendRedirect("uploadAssignment.jsp");
            }
 
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
	}

}
