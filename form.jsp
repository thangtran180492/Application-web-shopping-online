<%
	Cookie[] cookies = request.getCookies();
	String name = "", pass = "", rem = "";
	for(Cookie cookie: cookies ){
		if(cookie.getName().equals("cookuser")){
			name = cookie.getValue();
		}else if(cookie.getName().equals("cookpass")){
			pass = cookie.getValue();
		}else if(cookie.getName().equals("cookremb")){
			rem = cookie.getValue();
		}
	}
%>

<div class="login">
	<div class="form">
		<form action="${pageContext.request.contextPath}/LoginController" method="post">
			<h1>Sign in</h1>
			<input name="username" type="text" value="<%= name %>" /><br>
			
			<input name="password" type="password" value="<%= pass %>"/><br>
			
			<input name="remember" type="checkbox" value="1" 
			<%=  "1".equals(rem.trim()) ? "checked" : "" %>/>
			<label>Forgot password</label><br>
			<input type="submit"  value="LOGIN" />
		</form>
	</div>
	<div class="title-login">
		<h1>Welcome back</h1>
		<p>To keep connected with us please login with your person info</p>
	</div>
</div>