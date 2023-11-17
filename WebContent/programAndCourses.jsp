<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	<%@ include file="header.jsp"%>

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form method="post"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Recommendation Form</h2>
					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Program</label> <input type="text"
							placeholder="Enter Program" name="username" class="form-control"
							id="program">
					</div>
				</div>
				
				<%-- Course text box --%>
			
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Course</label> <input type="text"
							placeholder="Enter Course" name="course" class="form-control"
							id="course" >
					<button type="button" onclick="addToList()">Add to List</button>
						
					</div>
				</div>
				<%-- List of courses --%>
				
				<div class = "row">
					<div class="col-md-12 form-group">
					<ul id="courseList">		
					
					</ul>
				
				    <script>
				        function addToList() {
				        	//FIXIT
				        	//clicking on course text box and hitting enter removes most recent li
				        	
				        	
				            <%-- Get the input value --%>
				            var courseCode = document.getElementById('course').value;				
				            if (courseCode.trim() !== "") {
				            	
				                // Create a new list item
				                var listItem = document.createElement("li");
				
				                // Create a new span for the course code
				                var courseCodeSpan = document.createElement("span");
				                courseCodeSpan.style.display = 'block';
				                courseCodeSpan.appendChild(document.createTextNode(courseCode));
				                
				                //style span
				                courseCodeSpan.style.display = "inline-flex";
				                courseCodeSpan.style.alignItems = "center"
				                courseCodeSpan.style.verticalAlign = "middle";	
				                courseCodeSpan.style.paddingLeft = "5px";
				
				                // Create a new remove button
				                var removeButton = document.createElement("button");
				                removeButton.appendChild(document.createTextNode("Remove"));
				                removeButton.onclick = function() {
				                    listItem.remove();
				                };
				                
				            			             
				                //add course code and remove to listItem
				                listItem.appendChild(courseCodeSpan);
				                listItem.appendChild(removeButton);
				                
				                //style listItem
				                listItem.style.display = "flex";
				                listItem.style.marginBottom = "1%";
				                listItem.style.justifyContent = "space-between";
				                listItem.style.border = "1px solid black";
				                listItem.style.borderRadius = "5px";
				
				                // Add the new item to the list
				                var courseList = document.getElementById("courseList");
				                courseList.appendChild(listItem);
				
				                // Clear the input field
				                course.value = "";
				            }
				        }
				    </script>
				    </div>
				</div>
				
				<%-- Continue --%>
				 <div class="row">
					<div class="col-md-12 form-group">
						<button type="button" href="recommendations.jsp" id="continue">Continue</button>
							<script>
							    // Get the button element by its ID
							    var myButton = document.getElementById('continue');
							
							    // Add a click event listener to the button
							    myButton.addEventListener('click', function () {
							      // Specify the URL of the page you want to navigate to
							      var newPageUrl = 'recommendations.jsp'; // Replace with your desired URL
							
							      // Navigate to the new page
							      window.location.href = newPageUrl;
							    });
					  	</script>
					</div>
				</div>
			</form>

		</div>
	</div>

	<%@ include file="footer.html"%>

</body>
</html>