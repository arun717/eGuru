<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>	
<%@page import="java.util.ArrayList"%>
<%
	String id = request.getParameter("tb_teamid");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "eguru";
	String userid = "root";
	String password = "";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet1 = null;
	ResultSet resultSet2 = null;
	ResultSet resultSet3 = null;
	
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title></title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>

<body>
	<%
		String message = null;
		String sessionID = null;
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null)
		{
			for(Cookie cookie : cookies)
			{
				if(cookie.getName().equals("message")) 
					message = cookie.getValue();
				if(cookie.getName().equals("JSESSIONID")) 
					sessionID = cookie.getValue();
			}
		}
	%>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
	    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
	        <!-- 
	        <ul class="navbar-nav mr-auto">
	            <li class="nav-item active">
	                <a class="nav-link" href="#">Left</a>
	            </li>
	
	            <li class="nav-item">
	                <a class="nav-link" href="#">Link</a>
	            </li>
	
	        </ul>
	        -->
	    </div>
	    <div class="mx-auto order-0">
	        <a class="navbar-brand mx-auto" href="#">e-Guru</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	    </div>
	    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="contact.jsp">Contact</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="LogoutServlet">Log Out</a>
	            </li>
	        </ul>
	    </div>
    </nav>




    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">

            </div>

            <ul class="list-unstyled components">
                <p style="color:Black;">Quick Links</p>
                
                <li>
	                <a href="index.jsp">Team Dashboard</a>
	            </li>
                
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Update</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
	                        <a href="register.jsp">Register New Team</a>
	                    </li>
	                    <li>
	                        <a href="addMember.jsp">Add Team Member To Existing Team</a>
	                    </li>
						<li>
	                        <a href="offlineQuestions.jsp">Add Post to offline question Board</a>
	                    </li>
                    </ul>
                </li>
                
                <!-- 
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                        <li>
                            <a href="#">Page 2</a>
                        </li>
                        <li>
                            <a href="#">Page 3</a>
                        </li>
                    </ul>
                </li>
                -->
               
	            <li>
	                <a href="allQuestions.jsp">View Assignments</a>
	            </li>
	            <li>
	                <a href="about.jsp">About</a>
	            </li>
	            <li>
	                <a href="contact.jsp">Contact</a>
	            </li>
	            <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Feedback</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="feedback.jsp">Give Feedback</a>
                        </li>
                        <li>
                            <a href="viewfeed.jsp">View all Feedback</a>
                        </li>
                    </ul>
                </li>
	            <li>
	                <a href="LogoutServlet">LogOut</a>
	            </li>
            </ul>


        </nav>

        <!-- Page Content  -->
        
        
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                    
                </div>
            </nav>


			<H3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			View all assignment questions by ID</H3>
			
			<%
					ArrayList<String> al_type_1_4 = new ArrayList<String>();
					ArrayList<String> al_type_2 = new ArrayList<String>();
					ArrayList<String> al_type_3 = new ArrayList<String>();
					try
					{
						connection = DriverManager.getConnection(connectionUrl+database, userid, password);
						statement=connection.createStatement();
						
						int no_of_teams = 0; 
						String sql1 = "SELECT * FROM lvl1_4_assig";
						resultSet1 = statement.executeQuery(sql1);	
						%>						
						<table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center"><table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center">
						<%
						
						while(resultSet1.next())
						{
							String id1 = resultSet1.getString("Assignment_id");
							String objectives = resultSet1.getString("Objectives");
							String outcomes = resultSet1.getString("Outcomes");
							String questions = resultSet1.getString("Questions");
							String resources = resultSet1.getString("Resources");
							
							String line1 = id1 +"\n"+ objectives +"\n"+ outcomes +"\n"+ questions +"\n"+ resources +"\n";
							al_type_1_4.add(line1);
							%>
							<tr>
							<td style="color:blue">Assignment id:</td>
							<td><%=id1 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Objectives:</td>
							<td><%=objectives %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Outcomes:</td>
							<td><%=outcomes %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Questions:</td> 
							<td><%=questions %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Resources:</td> 
							<td><%=resources %></td>
							</tr>
							<%
						}
						%>
						</table> <br><br>
						<%
						
						String sql2 = "SELECT * FROM lvl2_tbl_assig";
						resultSet2 = statement.executeQuery(sql2);	
						
						%>						
						<table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center"><table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center">
						<%
						
						while(resultSet2.next())
						{
							String id1 = resultSet2.getString("Assignment_id");
							String prep = resultSet2.getString("Prepreparation");
							String obj = resultSet2.getString("Objectives");
							String outcomes = resultSet2.getString("Outcomes");
							String ques = resultSet2.getString("Questions");
							String res = resultSet2.getString("Resources");
							
							String line2 = id1 +"\n"+ prep +"\n"+ obj +"\n"+ outcomes +"\n"+ ques +"\n"+ res +"\n";
							al_type_2.add(line2);
							%>
							<tr>
							<td style="color:blue">Assignment id:</td>
							<td><%=id1 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Pre preparation:</td>
							<td><%=prep %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Objectives:</td>
							<td><%=obj %></td>
							</tr>														
							
							<tr>
							<td style="color:blue">Outcomes:</td>
							<td><%=outcomes %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Questions:</td>
							<td><%=ques %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Resources:</td>
							<td><%=res %></td>
							</tr>
							
							<%
						}
						
						
						%>
						</table> <br><br>
						<%	
						String sql3 = "SELECT * FROM lvl3_csd_assig";
						resultSet3 = statement.executeQuery(sql3);	
						%>						
						<table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center"><table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center">
						<%
	
						while(resultSet3.next())
						{
							String id1 = resultSet3.getString("Assignment_id");
							String solo1 = resultSet3.getString("Solo_1");
							String solo2 = resultSet3.getString("Solo_2");
							String solo3 = resultSet3.getString("Solo_3");
							String solo4 = resultSet3.getString("Solo_4");
							
							String pair1 = resultSet3.getString("Pair_1");
							String pair2 = resultSet3.getString("Pair_2");
							
							String quad1 = resultSet3.getString("Quad_1");

							
							String line3 = id1 +"\n"+ solo1 +"\n"+ solo2 +"\n"+ solo3 +"\n"+ solo4 +"\n"+ pair1 +"\n"+ pair2 +"\n"+ quad1 +"\n";
							
							al_type_3.add(line3);
							%>
							<tr>
							<td style="color:blue">Assignment id:</td>
							<td><%=id1 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Solo_1:</td>
							<td><%=solo1 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Solo_2:</td>
							<td><%=solo2 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Solo_3:</td>
							<td><%=solo3 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Solo_4:</td>
							<td><%=solo4 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Pair_1:</td>
							<td><%=pair1 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Pair_2:</td>
							<td><%=pair2 %></td>
							</tr>
							
							<tr>
							<td style="color:blue">Quad_1:</td>
							<td><%=quad1 %></td>
							</tr>
							
							<%
						}
						%>
						</table> <br><br>
						<%
	
						connection.close();
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
				%>		
				
		</div>
    </div>


	<!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
</body>

</html>