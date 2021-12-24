<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>
<%Blob image = null;%>
<html>
<head><title>Insert</title></head>
<body>

<%
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}

try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3307/wt","root", "");
st = con.createStatement();

String user1=request.getParameter("user");
String pass1=request.getParameter("pswd");
String email1=request.getParameter("email");
rs=st.executeQuery("select username,email from userform where username='"+user1+"' or email='"+email1+"'");
int s;
if(!rs.isBeforeFirst() && rs.getRow() == 0){
s = st.executeUpdate("insert into userform(username,password,email) values('"+user1+"','"+pass1+"','"+email1+"')");
//forward to home page
%>
	<jsp:forward page="login.jsp">  
<jsp:param name="f" value="Account created Successfully!"/> 
</jsp:forward><%
}
else{%>
	<jsp:forward page="signup.jsp">  
<jsp:param name="x" value="Username/Email already exists..."/> 
</jsp:forward><%
}
rs.close();
st.close();
con.close();

}catch(SQLException exception){
out.println(exception);
out.println("<!--");
StringWriter sw = new StringWriter();
PrintWriter pw = new PrintWriter(sw);
exception.printStackTrace(pw);
out.print(sw);
sw.close();
pw.close();
out.println("-->");
}
%>
</body>
</html> 