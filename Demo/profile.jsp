<!DOCTYPE html>
<html>
<head>
	<title>profile</title>
	<style type="text/css">
		<%@ include file="../Demo/profile_style.css"%>
	</style>
</head>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<% 
Blob image = null;
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String email=null;
String age=null;
String firstname=null,lastname=null,college=null,city=null;
byte[ ] imgData = null ;
String u_name=(String)session.getAttribute("username");
try {
Class.forName("com.mysql.jdbc.Driver");
con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/wt","root","");
stmt = con.createStatement();
rs = stmt.executeQuery("select * from userform where username='"+u_name+"'");
 while(rs.next()){
 firstname=rs.getString("firstname");
 lastname=rs.getString("Lastname");
 college=rs.getString("college");
 city=rs.getString("city");
 age=rs.getString("age");
 email=rs.getString("email");
  image = rs.getBlob("photo");
 imgData = image.getBytes(1,(int)image.length());
 String encode = Base64.getEncoder().encodeToString(imgData);
 request.setAttribute("imgBase", encode);}
 }
 
finally {
try {
rs.close();
stmt.close();
con.close();
}
catch (SQLException e) {
e.printStackTrace();
}
}
%>
<aside class="profile-card">
  <header>
    <!-- here’s the avatar -->
    <a target="_blank" href="#">
      <img src="data:image/jpeg;base64,${imgBase}" class="hoverZoomLink" width="200" height="100">      
    </a>

    <!-- the username -->
    <h1>
            <% String name=(String)session.getAttribute("username");  
			out.print(name);  %>
          </h1>

    <!-- and role or location -->
    <h2>
            <% out.println(email);%>
          </h2>

  </header>

  <!-- bit of a bio; who are you? -->
  <div class="profile-bio">
  	<%
            if(request.getParameterMap().containsKey("x")){
            %>
            <div class="note"><%
            out.print(request.getParameter("x")); %></div><% } %>
  	<div class="prof">
  		<form action="update.jsp" method="get">
  		<table>
  			<tr><td><b>FirstName</b> </td><td align="left"><input type="text" class="uma" name="fn" placeholder="<% out.print(firstname);%>" value="<% out.print(firstname);%>"></td></tr>
  			<tr><td><b>LastName</b> </td><td align="left"><input type="text" class="uma" name="ln" placeholder="<% out.print(lastname);%>" value="<% out.print(lastname);%>"></td></tr>
  			<tr><td><b>College</b> </td><td align="left"><input type="text" class="uma" name="cn" placeholder="<% out.print(college);%>" value="<% out.print(college);%>"></td></tr>
  			<tr><td><b>Age</b> </td><td align="left"><input type="text" class="uma" name="age" placeholder="<% out.print(age);%>" value="<% out.print(age);%>"></td></tr>
  			<tr><td><b>City</b></td><td align="left"><input type="text" class="uma" name="city" placeholder="<% out.print(city);%>" value="<% out.print(city);%>"></td></tr>
  			<tr><td colspan="2"><input type="submit" value="Update"></td></tr>

  		</table>
  		</form>
  	  </div>
  </div>
</aside>
</body>

</html>