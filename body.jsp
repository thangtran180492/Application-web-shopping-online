<div class="body">
	<div class="row">
		<div class="leftcolumn">
			<div class="list-product">
				<%! String nameS = "CELLPHONE"; %>
				<%! String[] nameProduct = {"iPhone 12 64GB","iPhone 12 - 64GB","iPhone 13 Pro Max...","iPhone 13","iPhone 14 Pro M...","iPhone 14 128GB"}; %>
				<%! String[] price = {"421.40$ USD","456.45$ USD","534.05$ USD","645.74$ USD","764.21$ USD","869.37$ USD"}; %>
				<% for(int i = 1; i <= 6; i++){ %>
				<div class="card">
					<a href="#">
						<div class="fakeimg">
							<img class="imgProduct" src="${pageContext.request.contextPath}/web/asset/product/iphone<%= i %>.png" alt="avartar"/>
						</div>
						<p class="name-shop"><%= nameS %></p>
						<p class="name-product"><%= nameProduct[i -1] %></p>
						<p class="price"><%= price[i - 1] %></p>
					</a>
				</div>
				<% } %>
			</div>
			<div class="page">
				<a href="#">back</a>
				<% for(int i = 1; i < 10; i++){ %>
					<a href="#"><%= i %></a>
				<% } %>
				<a href="#">next</a>
			</div>
		</div>
			<div class="rightcolumn">
				<div class="card" id="myCart">
					<a class="cart" href="#">
						<img src="${pageContext.request.contextPath}/web/asset/image/icon cart.png"/>
						<h3>Shopping cart</h3>
					</a>
					<div class="fakeimg">
						<img class="imgProduct" src="${pageContext.request.contextPath}/web/asset/product/iphone4.png" alt="avartar"/>
					</div>
					<p>Lego 360 detailed puzzle set...</p>
				</div>
				
				<div class="card" id="popular">
					<h3>Popular product or banners </h3>
					<% for(int i = 1; i <= 3; i++){ %>
					<img class="imgProduct" src="${pageContext.request.contextPath}/web/asset/product/iphone<%= i %>.png" alt="avartar"/>
					<% } %>
				</div>
			</div>
	</div>
</div>