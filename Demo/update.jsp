<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>
<% HttpSession s = request.getSession();%>
<html>
<head><title>auth</title></head>
<body>

<%
String firstname=null,lastname=null,age=null,college=null,city;
firstname=request.getParameter("fn");
lastname=request.getParameter("ln");
age=request.getParameter("age");
city=request.getParameter("city");
college=request.getParameter("cn");
String user=(String)session.getAttribute("username");

try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}

try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3307/wt","root", "");
st = con.createStatement();
int i=st.executeUpdate("UPDATE userform SET firstname = '"+firstname+"',lastname='"+lastname+"',age='"+age+"',college='"+college+"',city='"+city+"' WHERE username='"+user+"';");
%>
<jsp:forward page="profile.jsp">  
<jsp:param name="x" value="Updated Successfully"/> 
</jsp:forward><%
}

catch(SQLException e){}
%>