<%
	String welcome = (String)session.getAttribute("user");
%>
<div class="content">
	<div class="content-cover">
		<div class="my-home">
			<% if(welcome != null) { 
				String[] name = welcome.split("@");
			%>
				<h1 style="float: left;
	    			margin-left: 70px;
	    			color: #FF7235;">
	    			Welcome <%= name[0] %>
	    		</h1>
    		<% } %>
			<a href="${pageContext.request.contextPath}/LogoutController">
				<img alt="photo" src="${pageContext.request.contextPath}/web/asset/image/icon user.png"/>
				Logout
			</a>
			<a href="<%= response.encodeUrl(request.getContextPath() + "/web/home.jsp") %>">
				<img alt="photo" src="${pageContext.request.contextPath}/web/asset/image/home.png"/>
			</a>
		</div>
		<img class="cover" alt="photo" src="${pageContext.request.contextPath}/web/asset/image/ship boat.jpg"/>
		
	</div>
	<div class="content-list">
		<p class="members">Member of the team</p>
		<table>
			<tr>
				<th class="id">id</th>
				<th class="name">name</th>
				<th class="student">student</th>
				<th class="class">class</th>
			</tr>
			<% for(int i = 1; i <= 3; i++){ %>
			<tr>
				<td class="id"><%= i %></td>
				<td class="name">member <%= i %></td>
				<td class="student">member code <%= i %></td>
				<td class="class">class <%= i %></td>
			</tr>
			<% } %>
		</table>
	</div>
</div>