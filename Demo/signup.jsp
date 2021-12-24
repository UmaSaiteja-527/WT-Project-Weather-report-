<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		<%@ include file="../Demo/style.css"%>
	</style>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
	<div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
  				<h3>Sign Up</h3>
  			</div>
  		</div>
  			<form action="insert.jsp" method="post">
  			<%
            if(request.getParameterMap().containsKey("x")){
            %>
            <div class="note"><%
            out.print(request.getParameter("x")); %></div><% } %>
          <br>
  			<input type="text" name="user" placeholder="Username" required>
			<input id="Email" name="email" placeholder="Email" type="text" required>
			<input id="password" name="pswd" placeholder="password" type="password">
			<span>size should be greater than 8</span>
			<input id="confirm_password" name="confirm_password" placeholder="Retype password" type="password">
			<span>Your passwords do not match</span>
			<input type="submit" value="Create My Account" id="submit">
			<p class="message">Already a member? <a href="login.jsp">Login here</a></p>
</form>
<script type="text/javascript">
<%@ include file="../Demo/pass_val.js"%>
</script>
</div>
</div>
</body>
</html>