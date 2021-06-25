# eGuru

eGuru Server: hosted over e-Mentoring Platform

The tool consists of a Team Dashboard that helps teachers to organise the students into teams and mentor them effectively.

When a student (working on a team project hosted over GitHub) connects with the server, he/she sends the URL of the GitHub repository to the server. 

The server stores the team information and team member information in a MySQL database.


eGuru Client: It is a PDE eclipse plugin written in Java
Please read the readme file regarding how to intall plugin in eclipse

Tables required for running the project in MySql database:
Refer sql queries file for this
=======================================================================================

Preferred Softwares to run the project to be installed:
1. Eclipse
2. XAMPP {This will include the MySql database}

Setting up XAMPP
1. Download and install XAMPP software
You may use this url or download from other sources too (https://www.apachefriends.org/download.html)

2. Once you have installed XAMPP, run the XAMPP Control panel and Start "Apache" and "MySQL" Modules as shown in below screenshot

![image](https://user-images.githubusercontent.com/37172062/123421749-e4043580-d5da-11eb-8ae8-fb8081f72068.png)

3. After that please open the admin page by clicking on the button "Admin" in front of MySQL in your XAMPP control panel.
   This will redirect you to the phpMyAdmin page within a new browser window.

4. On the extreme top left of your screen here, you may find "new" button to create a new MySQL database.
   Use that to create a database named as "eguru" and click on create.
   



