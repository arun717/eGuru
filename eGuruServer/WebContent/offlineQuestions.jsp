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
            
            <table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center"><table class="table table-bordered table-hover" style="border:1px solid black;margin-left:100px;margin-right:auto;padding:2px;border-spacing:20px;align:center">					
					<tr>
					<td style="color:blue">Username:</td>
					<td> Arun</td>
					</tr>
					
					<tr>
					<td style="color:blue">Question:</td>
					<td> I am building a simple client/server application using java sockets.<br>  
					See my code for the client http://geekcoder.com/m37e4c577 <br>
					However this doesn't seem to work and i cannot figure out what's not working.<br> 
					The code commented is from sample program and works fine.<br>												
					Can anyone see anything i am doing wrong?</td>
					</tr>				
					
					<tr>
					<td style="color:red">Add Reply:</td> 
					<td>
						<textarea id="w3review" name="w3review" rows="4" cols="50">
								
						</textarea> 
					</td>
					</tr>
					<tr>
					<td colspan="2"></td>
					</tr>	
					
					
					<tr>
					<td style="color:blue">Username:</td>
					<td> Naveen </td>
					</tr>
					
					<tr>
					<td style="color:blue">Question:</td>
					<td>How can I ping an IP address using a socket program and send data through it in Java ?<br>
					Can anybody suggest any good material for the same...</td>
					</tr>				
					
					<tr>
					<td style="color:red">Add Reply:</td> 
					<td>
						<textarea id="w3review" name="w3review" rows="4" cols="50">
								
						</textarea> 
					</td>
					</tr>
					<tr>
					<td colspan="2"></td>
					</tr>	
					
					
					<tr>
					<td style="color:blue">Username:</td>
					<td> Vishal</td>
					</tr>
					
					<tr>
					<td style="color:blue">Question:</td>
					<td> I am stuck in Java implementation regarding concurrent TCP servers.<br>
					Can anybody suggest any good source to refer...
					</td>
					
					</tr>				
					
					<tr>
					<td style="color:red">Add Reply:</td> 
					<td>
						<textarea id="w3review" name="w3review" rows="4" cols="50">
								
						</textarea> 
					</td>
					</tr>
					<tr>
					<td colspan="2"></td>
					</tr>	
					
					
					<tr>
					<td style="color:blue">Username:</td>
					<td> Vishnu</td>
					</tr>
					
					<tr>
					<td style="color:blue">Question:</td>
					<td>How to make use of socket bind in case of UDP using java programming?</td>
					</tr>				
					
					<tr>
					<td style="color:red">Add Reply:</td> 
					<td>
						<textarea id="w3review" name="w3review" rows="4" cols="50">
								
						</textarea> 
					</td>
					</tr>
					<tr>
					<td colspan="2"></td>
					</tr>	
			</table> <br><br>
    
	    
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