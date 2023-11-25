<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Recommendations</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #E6F9E6;">

 <script>
 document.addEventListener("DOMContentLoaded", function() {
	 
				 
	 	var minItems = 3;
	 	var maxItems = 8;
	 
		const seed = localStorage.getItem("seed");
		console.log(seed);
		
		//index of item to be kept
		var keep = seed.charAt(0);
		
		
		//quantity recommended for item at index of keep
		var quantityToKeep = 0;
		
		var itemsNeeded = seed.charAt(0);
		
		//stops from having too few items
		itemsNeeded = itemsNeeded > minItems ? itemsNeeded : minItems;
		
		//stops from having too many items
		itemsNeeded = itemsNeeded < maxItems ? itemsNeeded : maxItems;
		var numItems = 0;	
		var index = 0;
					
		var i = 0;
		
	     var rows = document.getElementById("productTable").getElementsByTagName("tr");

		
		for(var i = 0;i<rows.length-1;i++){
			if(i!=keep){
				var remove = document.getElementById(i);
				
				//hide elements instead of removing them, so that they can be looped through
				remove.style.display = "none";				
				
				//remove.parentNode.removeChild(remove);
			}
			else{
				//set new index
				var seedChar = seed.charAt((i)%rows.length)
				
				keep = i+parseInt(seedChar,10);
				
				quantityToKeep = keep;
				
				var quantity = document.getElementById("quantity"+i);
				quantity.textContent = quantityToKeep+1;
			}
		}
		
		//MAYBEDO
		//delete all tr element with display="none"
		
		 
		 for(var i = 0;i<rows.length-1;i++){
			 var totalId = document.getElementById("total"+i);
				var quantity = document.getElementById("quantity"+i).textContent;
				var price = document.getElementById("price"+i).textContent;
				var total = parseInt(quantity,10) * parseFloat(price,10);
				
				console.log(total);
				
				totalId.textContent = total;
		 }

	    
	});	
	</script>

	<%@ include file="header.jsp"%>

	<%
	String message = request.getParameter("message");


	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();
	
	products = prodDao.getAllProducts();

	
	%>
	<div class="text-center"
		style="color: green; font-size: 24px; font-weight: bold;">Order
		Details</div>
	<!-- Start of Product Items List -->
	<div class="container">
		<div class="table-responsive ">
			<table class="table table-hover table-sm" id="productTable">
				<thead
					style="background-color: black; color: white; font-size: 14px; font-weight: bold;">
					<tr>
						<th>Picture</th>
						<th>ProductName</th>
						<th>Add</th>
						<th>Remove</th>					
						<th>Quantity</th>
						<th>Price</th>
						<th>Total</th>
					

					</tr>
				</thead>
				<tbody
					style="background-color: white; font-size: 15px; font-weight: bold;">
					<%
					int id = 0;
					for (ProductBean order : products) {
					%>

					<tr id="<%=id%>">
						<td><img src="./ShowImage?pid=<%=order.getProdId()%>"
							style="width: 50px; height: 50px;"></td>
						<td><%=order.getProdName()%></td>
						<td id="add<%=id%>">
						<button>Add</button>
						</td>
						<td id="delete<%=id%>">
						<button>Remove</button>
						</td>
			
						<td id="quantity<%=id%>"></td>
						<td id="price<%=id%>"><%=order.getProdPrice()%></td>
						<td id="total<%=id%>"></td>
						
						<script>
						
						</script>
						
						<%id++; %>
					</tr>

					<%
					}
					%>

				</tbody>
			</table>
		</div>
	</div>
	<!-- ENd of Product Items List -->

	<%@ include file="footer.html"%>

</body>
</html>