<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
    
    <script>
    	function change(obj) {
	        var selectBox = obj;
	        var selected = selectBox.options[selectBox.selectedIndex].value;
	        
	        var tbl_ind = document.getElementById("common");
	        var tbl_tbl = document.getElementById("tbl");
	        var tbl_cpp_cqp = document.getElementById("cpp_cqp");
	        var tbl_csd = document.getElementById("common");
	
	        if(selected === '1')
	        {
	        	tbl_ind.style.display = "none";
	        	tbl_tbl.style.display = "none";
	        	tbl_cpp_cqp.style.display = "none";
	        	tbl_csd.style.display = "block";
	        }
	        else if(selected === '2'){
	        	tbl_ind.style.display = "none";
	        	tbl_tbl.style.display = "block";
	        	tbl_cpp_cqp.style.display = "none";
	        	tbl_csd.style.display = "none";
	        }
	        else if(selected === '3'){
	        	tbl_ind.style.display = "none";
	        	tbl_tbl.style.display = "none";
	        	tbl_cpp_cqp.style.display = "block";
	        	tbl_csd.style.display = "none";
	        }
	        else if(selected === '4'){
	        	tbl_ind.style.display = "none";
	        	tbl_tbl.style.display = "none";
	        	tbl_cpp_cqp.style.display = "none";
	        	tbl_csd.style.display = "block";
	        }
	        else if(selected === '0'){
	        	tbl_ind.style.display = "none";
	        	tbl_tbl.style.display = "none";
	        	tbl_cpp_cqp.style.display = "none";
	        	tbl_csd.style.display = "none";
	        }

    	}
    </script>
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
					<a href="#">Upload Assignment</a>
				</li>
				
				<li>
					<a href="#">Evaluation</a>
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

			<form action="upload" method="post">
			
			<div>
				<div align="center">
				**Note-   <br>
				CSD: Collaborative Software Development <br>
				CPP: Collaborative Pair Programming<br>
				CQP: Collaborative Quadruple Programming<br>
				</div>
			
	            <label style="margin-left:100px;margin-top:50px">Select the type of assignment...</label>
	            <select id="show" name="show_assign_types" onchange="change(this)">
	            	<option value="0">---Select--</option>
	                <option value="1">Level 1: Individual Learning Assignment</option>
	                <option value="2">Level 2: Team based Learning Assignment</option>
	                <option value="3">Level 3: Pre-Structured CSD Assignment</option>
	                <option value="4">Level 4: Self-Driven CSD Assignment</option>
	            </select>

        	</div>
        	
        	
        	<!--  Common for type 1 and 4 -->
        	<table id="common" class="table table-bordered table-hover" style="border:1px solid black;padding:2px;margin-left:100px;display: none;">				
				<tr>
					<td>Assignment ID</td>
					<td><input type="text" name="1_4_type_id" style="width:410px"> </td>
				</tr>
				
				<tr>
					<td>Objectives of the Assignment</td>
					<td><textarea name="1_4_obj" rows="3" cols="49">	</textarea></td>
				</tr>
				
				<tr>
					<td>Learning Outcomes</td>
					<td><textarea name="1_4_outcomes" rows="3" cols="49">	</textarea></td>
				</tr>
				
				<tr>
					<td>Assignment Questions  <br> [Enter URL of the document] </td>
					<td><textarea name="1_4_quest" rows="3" cols="49">	</textarea></td>
				</tr>
				
				<tr>
					<td>Add resources <br> [Enter URL of the document]</td>
					<td><textarea name="1_4_res" rows="3" cols="49">	</textarea></td>
				</tr>
				
			
			</table>


			<!--For type 2: Upload Pre-preparation material under upload assignment -->
			<table id="tbl" class="table table-bordered table-hover" style="border:1px solid black;padding:2px;margin-left:100px;display: none;">
				<tr>
					<td>Assignment ID</td>
					<td><input type="text" name="type2_id" style="width:410px"> </td>
				</tr>
				
				<tr>
					<td>Upload Pre-preparation materials <br> [Enter URL of the document]</td>
					<td> <textarea name="type2_preprep" rows="3" cols="49">	</textarea> </td>
				</tr>
				
				<tr>
					<td>Objectives of the Assignment</td>
					<td><textarea name="type2_obj" rows="3" cols="49">	</textarea></td>
				</tr>
				
				<tr>
					<td>Learning Outcomes</td>
					<td><textarea name="type2_outcome" rows="3" cols="49">	</textarea></td>
				</tr>
				
				<tr>
					<td>Assignment Questions  <br> [Enter URL of the document] </td>
					<td><textarea name="type2_ques" rows="3" cols="49">	</textarea></td>
				</tr>
				
				<tr>
					<td>Add resources <br> [Enter URL of the document]</td>
					<td><textarea name="type2_res" rows="3" cols="49">	</textarea></td>
				</tr>
							
			
			</table>
			
			
											
			<!--  For type 3 -->
			<table id="cpp_cqp" class="table table-bordered table-hover" style="border:1px solid black;padding:2px;margin-left:100px;display: none;">				
				<tr>
					<td>Assignment ID</td>

					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="type3_id" style="width:410px"> </td>
				</tr>
				<tr>
					<td>Solo Tasks</td>
					
					<td>
						Task A: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="type3_solo1" rows="1" cols="49">	</textarea> <br>
						Task B: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="type3_solo2" rows="1" cols="49">	</textarea> <br>
						Task C: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="type3_solo3" rows="1" cols="49">	</textarea> <br>
						Task D: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="type3_solo4" rows="1" cols="49">	</textarea> <br>
					</td>
				</tr>
				
				<tr>
					<td>Pair Tasks</td>
					
					<td>
						Task AB:&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="type3_pair1" rows="2" cols="49">	</textarea> <br>
						Task CD:&nbsp;&nbsp;&nbsp;&nbsp; <textarea name=type3_pair2 rows="2" cols="49">	</textarea> <br>
					</td>
				</tr>
				
				<tr>
					<td>Quadruple<br> Tasks</td>
					
					<td>Task ABCD: <textarea name="type3_quad1" rows="2" cols="49">	</textarea> <br></td>
				</tr>													
				
				
			</table>
			
			
			<div align="center"><td colspan="2"  align="center" bgcolor="lightgrey"><input type="submit" value="Submit"/></td> </div>
			</form>
	
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