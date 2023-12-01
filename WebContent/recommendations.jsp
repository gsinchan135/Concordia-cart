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
	 
	 
	 	//gets a list of random numbers from the seed
	 	var recs = getRandomNums();
	 	
				
		revealRows(recs[0],recs[1]);
		
		getTotal();
		
		
		
		
		function getRandomNums(){
	 		var minItems = 3;
		 	var maxItems = 8;
		 
			const seed = (localStorage.getItem("seed"));
			console.log(seed);
			
			//indexes of item to be kept
			var keep = [];
			var quantity = [];
			
			var itemsNeeded = Math.abs(parseInt(seed[0])-parseInt(seed[1]));
			
			//stops from having too few items
			itemsNeeded = itemsNeeded > minItems ? itemsNeeded : minItems;
			
			//stops from having too many items
			itemsNeeded = itemsNeeded < maxItems ? itemsNeeded : maxItems;
			var numItems = 0;	
			var index = 0;
										
			var currentIndex = 1;
			
			//get random numbers from seed to pick which rows are recommended
			for(var i = 0;i<itemsNeeded;i++){
			    const currentNumber = parseInt(seed[currentIndex])+1;

				keep.push(currentNumber);
				quantity.push(Math.round(seed[currentIndex*2%seed.length]*2.5));
						
						
			    currentIndex = (currentIndex + currentNumber) % seed.length;
			}
			var arrs = [keep,quantity];
			
			return arrs;
	 	}
		
		
		function revealRows(keep,quantity){
			var rows = document.getElementsByClassName("items");
			currentIndex = 0;
			
			for(var i = 0;i<keep.length;i++){
				
				currentIndex = (currentIndex+keep[i])%rows.length-1;
								
				var rowId = document.getElementById("row"+currentIndex);
				//console.log(rowId);
				
				//if the row hasn't already been revealed, reveal it
				
				
				if(window.getComputedStyle(rowId).getPropertyValue("display") == "none"){
					rowId.style.display = "table-row";
					
					//sets quantity based on what's in quantity array
					var quantityId = document.getElementById("quantity"+currentIndex);
					
								
					quantityId.textContent =  quantity.pop();
					
				}
				else{
					//if it loops back around and the element is already revealed, it will try to reveal another row
					i--;
				}
				
			}
			
			
			
		}
		
		
		function getTotal(){
			var rows = document.getElementsByClassName("items");
			
			for(var i = 0;i<rows.length-1;i++){
				 var totalId = document.getElementById("total"+i);
					var quantity = document.getElementById("quantity"+i).textContent;
					var price = document.getElementById("price"+i).textContent;
					var total = parseInt(quantity,10) * parseFloat(price,10);
										
					totalId.textContent = total;
			 }
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
						<th>Add To Card</th>
					

					</tr>
				</thead>
				<tbody
					style="background-color: white; font-size: 15px; font-weight: bold;">
					<%
					int id = 0;
					for (ProductBean order : products) {
					%>

					<tr id="row<%=id%>" style="display: none" class="items">
						<td><img src="./ShowImage?pid=<%=order.getProdId()%>"
							style="width: 50px; height: 50px;"></td>
						<td><%=order.getProdName()%></td>
						<td id="add<%=id%>">
						
						
						<!--TODO:
						Increase the quantity by 1 when button pressed
						-->					
						<button>Add</button>
						</td>
						<td id="delete<%=id%>">
						<!--TODO:
						Decrease Quantity by 1 when button pressed
						-->		
						<!-- TODO:
						If quantity is set to 0, item should be removed
						 -->			
						<button>Remove</button>
						</td>
			
						<!--TODO:
						Be able to click on the quantity and change it by typing
						if the item is an electronic, the quantity should be 1
						 -->
						<td id="quantity<%=id%>"></td>
						<td id="price<%=id%>"><%=order.getProdPrice()%></td>
						
						<!--TODO: Total should change when the quantity is changed -->
						<td id="total<%=id%>"></td>
						<td>
						<!--TODO: 
						Adds item to the cart when button pressed and remove from list
						-->
						<button>Add To Cart</button>
						</td>
					
						
					</tr>
						<%id++;%>

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