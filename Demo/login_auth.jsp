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
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}

try{
con = DriverManager.getConnection("jdbc:mysql://localhost:3307/wt","root", "");
st = con.createStatement();

String user1=request.getParameter("user");
String pass1=request.getParameter("pswd");
session.setAttribute("username",user1);
rs = st.executeQuery("SELECT password FROM userform where username='"+user1+"'");
String x="No Username/Email exists";
if(!rs.next()){%>
<jsp:forward page="login.jsp">  
<jsp:param name="x" value="It's look like you're not yet a member! Click on the bottom link to signup."/> 
</jsp:forward>
<%
}
else{
do{
String name = rs.getString(1);
if(pass1.equals(name))
{
out.println("login success full");
response.sendRedirect("dashboard.jsp");
//forward to home page
}else{%>
<jsp:forward page="login.jsp">  
<jsp:param name="x" value="<%= x %>"/>  
</jsp:forward>
<%
}
}while(rs.next()); // end of whil
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