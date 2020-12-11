<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>	
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
	ResultSet resultSet = null;
	String team_id_num="";
%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <link rel="stylesheet" href="css/presentational.css">
    <link rel="stylesheet" href="css/circular-images.css">

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
			
			
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</h3>
			
			<table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center">
			  <thead class="thead-dark">
			    <tr>		
			      <th colspan="4">Team Dashboard</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%
					try{
					connection = DriverManager.getConnection(connectionUrl+database, userid, password);
					statement=connection.createStatement();
					
					int no_of_teams = 0; 
					String sql = "SELECT COUNT(DISTINCT TeamID) AS TOTAL FROM teammemberdetails;";
					resultSet = statement.executeQuery(sql);
					while(resultSet.next())
					{
						no_of_teams = Integer.parseInt(resultSet.getString("TOTAL"));
					}
					
					int j=1;
					String giturl[] = new String[no_of_teams+1];
					while(j<=no_of_teams)  
					{
						team_id_num = String.valueOf(j);
						//String memids[] = new String[4];					
						String mnames[] = new String[4];
						String mimgs[] = new String[4];
						String status[] = new String[4];
						int i = 0;
						sql ="select * from TeamMemberDetails where TeamID = "+team_id_num;
						resultSet = statement.executeQuery(sql);
											
						while(resultSet.next()){
							//memids[i] = resultSet.getString("MemberID");
							mnames[i] = resultSet.getString("MemberName");
							mimgs[i] = resultSet.getString("ImageUrl");
							
							if(resultSet.getString("Status").equalsIgnoreCase("online"))
								status[i] = "images/green.png";
							else
								status[i] = "images/red.png";
							i++;
						}	
						
						String sql2 = " SELECT GitHubURL FROM `teamdetails` WHERE TeamID = "+j;
						resultSet = statement.executeQuery(sql2);
						while(resultSet.next())
						{
							giturl[j] = resultSet.getString("GitHubURL");
						}
				%>
					
					<tr>		
						<td colspan="2" style="width: 50%;" bgcolor=lightyellow> Team Id Number <%=j%></td>
						<td colspan="2" style="width: 50%;" bgcolor=lightyellow align="right">  
						<a href="<%= giturl[j] %>" style="color:#0000ff;"><%= giturl[j] %></a></td>									
						
					</tr>
					<tr>
						<td align="center" style="width: 25%;"><img class="circular--square" src=<%= mimgs[0] %>></td>
						<td align="center" style="width: 25%;"><img class="circular--square" src=<%= mimgs[1] %>></td>
						<td align="center" style="width: 25%;"><img class="circular--square" src=<%= mimgs[2] %>></td>
						<td align="center" style="width: 25%;"><img class="circular--square" src=<%= mimgs[3] %>></td>
					</tr>
					<tr>		
						<td align="center" style="width: 25%;"><a href="liveEclipseView.jsp"><img src=<%=status[0] %>></a> &nbsp;<b><%=mnames[0] %></b></td>
						<td align="center" style="width: 25%;"><a href="liveEclipseView.jsp"><img src=<%=status[1] %>></a> &nbsp;<b><%=mnames[1] %></b></td>
						<td align="center" style="width: 25%;"><a href="liveEclipseView.jsp"><img src=<%=status[2] %>></a> &nbsp;<b><%=mnames[2] %></b></td>
						<td align="center" style="width: 25%;"><a href="liveEclipseView.jsp"><img src=<%=status[3] %>></a> &nbsp;<b><%=mnames[3] %></b></td>
					</tr>					
					
					<%
						j++;
					}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					
					%>
										    
			  </tbody>
			</table>

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