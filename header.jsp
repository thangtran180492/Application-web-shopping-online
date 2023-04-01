<div class="header-background">
	<div class="header-inside">
		<a class="link-home" href="#">
		<img class="logo" alt="phote" src="${pageContext.request.contextPath}/web/asset/image/logoMarket.png"><br>
		Phone AI model</a>
		<form class="Form-search">
			<input id="list" list="browsers" name="browser" id="browser" value="select"/>
			<datalist id="browsers">
				<option value="select 1">
				<option value="select 2">
				<option value="select 3">
				<option value="select 4">
			</datalist>
			<input id="text" type="text" name="text"/>
			<input id="submit" type="submit" value="Search"/>
		</form>
	</div>
</div>
<div class="topnav">
	<div class="menu-list">
		<a href="#">Home</a>
		<a href="#">Product</a>
		<a href="#">About</a>
		<a href="#">seach bar here</a>
		<div class="login">
		<% 
			String usernew = (String)session.getAttribute("user"); 
			if(usernew != null) {
		%>
			<a href="<%= response.encodeUrl(request.getContextPath() + "/web/admin/index.jsp") %>">
				<%= usernew %>
			</a>
		<% }else{ %>
			<a href="<%= response.encodeUrl(request.getContextPath() + "/web/login.jsp") %>">
				Login
			</a>
		<% } %>
		</div>
	</div>
</div>