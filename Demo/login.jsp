<!DOCTYPE html>
<html>
<head>
<style type="text/css">
<%@ include file="../Demo/style.css"%>
</style>
<title> Login </title>
</head>
<body>
  <body>
    <div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
            <h3>LOGIN</h3>
            <p>Please enter your credentials to login.</p>
          </div>
        </div>
        <form class="login-form" action="login_auth.jsp" method="POST">
            <%
            if(request.getParameterMap().containsKey("f")){
            %>
            <div class="note1"><%
            out.print(request.getParameter("f")); %></div><% } %>
            <%
            if(request.getParameterMap().containsKey("x")){
            %>
            <div class="note"><%
            out.print(request.getParameter("x")); %></div><% } %>
          <br>
          <input type="text" placeholder="username" name="user" required />
          <input type="password" placeholder="password" name="pswd" required/>
          <button>login</button>
          <p class="message">Not registered? <a href="signup.jsp">Create an account</a></p>
        </form>
      </div>
    </div>
</body>
</body>
</html>