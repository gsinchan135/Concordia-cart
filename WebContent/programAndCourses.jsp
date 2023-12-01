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
			<form action="./RecommendationsSrv" method="post"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Program and Courses Form</h2>
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
				
				<%-- Program options --%>
				
				<div class="row">
					<div class="col-md-12 form-group">
					
					<div display="block">
					
					<!--TODO:  
					the program inputted should be one of the options
					-->
					
						<label >Program:</label>
					</div>
						<div display="block">
						<input class="form-control" placeholder="Enter Program" list="programs" name="myProgram" id="programName">
						<datalist id="programs">
						  <option value="Accountancy (BComm)">
						  <option value="Accountancy (Cert)">
						  <option value="Acting for the Theatre (BFA)">
						  <option value="Actuarial Mathematics (BA, BSc)">
						  <option value="Actuarial Mathematics/Finance (BA, BSc)">
						  <option value="Adult Education">
						  <option value="Aerospace Engineering (BEng)">
						  <option value="Anthropology (BA)">
						  <option value="Anthropology and Sociology (BA)">
						  <option value="Art Education, Visual Arts (BFA)">
						  <option value="Art History (BFA)">
						  <option value="Art History and Film Studies (BFA)">
						  <option value="Art History and Studio Art (BFA)">
						  <option value="Arts and Science (Cert)">
						  <option value="Assurance, Fraud Prevention and Investigative Services">
						  <option value="Athletic Therapy">
						  <option value="Biochemistry (BSc)">
						  <option value="Biology (BSc)">
						  <option value="Biophysics">
						  <option value="Building Engineering (BEng)">
						  <option value="Business Studies">
						  <option value="Business Technology Management (BComm)">
						  <option value="Cell and Molecular Biology (BSc)">
						  <option value="Ceramics (BFA)">
						  <option value="Chemistry (BSc)">
						  <option value="Child Studies (BA)">
						  <option value="Civil Engineering (BEng)">
						  <option value="Classics (BA)">
						  <option value="Communication and Cultural Studies (BA)">
						  <option value="Communication Studies (BA)">
						  <option value="Community Service (Cert)">
						  <option value="Community, Public Affairs and Policy Studies (BA)">
						  <option value="Computation Arts (BFA)">
						  <option value="Computation Arts - Computer Science (BFA)">
						  <option value="Computer Engineering (BEng)">
						  <option value="Computer Science (BCompSc)">
						  <option value="Computer Science (Minor)">
						  <option value="Computer Science - Computation Arts (BCompSc)">
						  <option value="Contemporary Dance (BFA)">
						  <option value="Creative Writing (BA)">
						  <option value="Data Intelligence">
						  <option value="Data Science (BA/BSc)">
						  <option value="Data Science (BCompSc)">
						  <option value="Design (BFA)">
						  <option value="Design for the Theatre (BFA)">
						  <option value="Diversity and the Contemporary World">
						  <option value="Early Childhood and Elementary Education (BA)">
						  <option value="Ecology (BSc)">
						  <option value="Economics (BA)">
						  <option value="Economics (BComm)">
						  <option value="Education">
						  <option value="Electrical Engineering (BEng)">
						  <option value="Electroacoustic Studies (BFA)">
						  <option value="English and Creative Writing (BA)">
						  <option value="English and History (BA)">
						  <option value="English Literature (BA)">
						  <option value="Entrepreneurship">
						  <option value="Environmental and Sustainability Science (BSc)">
						  <option value="Environmental Geography (BSc)">
						  <option value="Études françaises (French Studies) (BA)">
						  <option value="Exercise Science (BSc)">
						  <option value="Family Life Education (Cert)">
						  <option value="Fibres and Material Practices (BFA)">
						  <option value="Film Animation (BFA)">
						  <option value="Film Production (BFA)">
						  <option value="Film Studies (BFA)">
						  <option value="Finance (BComm)">
						  <option value="Financial Reporting">
						  <option value="First Peoples Studies (BA)">
						  <option value="Foundations for Business (Cert)">
						  <option value="French Studies (Études françaises) (BA)">
						  <option value="Game Design (Minor)">
						  <option value="Geospatial Technologies (Minor)">
						  <option value="German Studies (Minor)">
						  <option value="Health and Life Sciences (BCompSc)">
						  <option value="History (BA)">
						  <option value="Human Environment (BA)">
						  <option value="Human Relations (BA)">
						  <option value="Human Resource Management (BComm)">
						  <option value="Human Rights Studies (Minor)">
						  <option value="Immigration Studies (Minor)">
						  <option value="Indigenous Bridging Program (Bcomm)">
						  <option value="Indigenous Bridging Program (BEng)">
						  <option value="Indigenous Bridging Program (Psychology BA, BSc)">
						  <option value="Industrial Engineering (BEng)">
						  <option value="Information Systems Audit and Risk Management">
						  <option value="Interdisciplinary Studies in Sexuality (BA)">
						  <option value="Intermedia (Video, Performance and Electronic Arts) (BFA)">
						  <option value="International Business (BComm)">
						  <option value="Irish Studies (BA)">
						  <option value="Israel Studies (Minor)">
						  <option value="Italian (BA)">
						  <option value="Jazz Studies (BFA)">
						  <option value="Journalism (BA)">
						  <option value="Judaic Studies (BA)">
						  <option value="Kinesiology and Clinical Exercise Physiology (BSc)">
						  <option value="Law and Society (Minor)">
						  <option value="Liberal Arts (BA)">
						  <option value="Linguistics (BA)">
						  <option value="Management (BComm)">
						  <option value="Marketing (BComm)">
						  <option value="Mathematical and Computational Finance (BA, BSc)">
						  <option value="Mathematics and Statistics (BA, BSc)">
						  <option value="Mechanical Engineering (BEng)">
						  <option value="Modern Arabic Language and Culture (Minor)">
						  <option value="Modern Chinese Language and Culture (Minor)">
						  <option value="Multidisciplinary Studies in Science (Minor)">
						  <option value="Music (BFA)">
						  <option value="Neuroscience (BSc)">
						  <option value="Painting and Drawing (BFA)">
						  <option value="Pastoral Care (Cert)">
						  <option value="Performance Creation (BFA)">
						  <option value="Philosophy (BA)">
						  <option value="Photography (BFA)">
						  <option value="Physics (BSc)">
						  <option value="Political Science (BA)">
						  <option value="Print Media (BFA)">
						  <option value="Professional Writing">
						  <option value="Psychology (BA, BSc)">
						  <option value="Pure and Applied Mathematics (BA, BSc)">
						  <option value="Quantitative Finance and Insurance">
						  <option value="Real Estate">
						  <option value="Recreation and Leisure Studies (BA)">
						  <option value="Religions and Cultures (BA)">
						  <option value="Scenography (BFA)">
						  <option value="Science and Technology (Cert)">
						  <option value="Science Foundations (Cert)">
						  <option value="Science Journalism">
						  <option value="Sculpture (BFA)">
						  <option value="Sociology (BA)">
						  <option value="Software Engineering (BEng)">
						  <option value="Southern Asia Studies (BA)">
						  <option value="Spanish, Hispanic Cultures and Literatures (BA)">
						  <option value="Statistics (BA, BSc)">
						  <option value="Studio Art (BFA)">
						  <option value="Supply Chain Operations Management (BComm)">
						  <option value="Sustainability Studies">
						  <option value="Systems and Information Biology (BSc)">
						  <option value="Teaching English as a Second Language">
						  <option value="Teaching English as a Second Language (TESL) (BEd)">
						  <option value="Theatre">
						  <option value="Theological Studies (BA)">
						  <option value="Therapeutic Recreation (BA)">
						  <option value="Traduction (Translation) (BA)">
						  <option value="Urban Studies and Urban Planning (BA)">
						  <option value="Women's Studies (BA)">
						</datalist>
								
						</div>
					</div>
				</div>
				
					<script>
    function validateProgram() {
        var inputProgram = document.getElementById('programName').value;
        var programsList = document.getElementById('programs').options;
        // Check if the entered program is in the list
        var programExists = false;
        for (var i = 0; i < programsList.length; i++) {
            if (programsList[i].value === inputProgram) {
                programExists = true;
                return true;
            }
        }
        // Display an alert if the program doesn't exist in the list
        if (!programExists) {
            alert('Please select a valid program from the list.');
            document.getElementById('programName').value = ''; // Clear the input field
            return false;
        }
    }
    
    
    
</script>
				
				<%-- Course text box --%>
			
				<div class="row">
					<div class="col-md-12 form-group">
					<!-- TODO:
					Check that regex follows squence of "XXXX YYYY" 
					where X is a letter and Y is a number
					Must be at least 3 letters and 3 letters
					But not more than 4 letters and 4 letters
					Space between the letters and numbers is optional
					-->
					
						<label for="last_name">Course</label> 
						<input type="text"
							placeholder="Enter Course" name="course" class="form-control"id="course" maxlength="8" pattern="[A-Za-z]{3,4}\s?\d{3,4}">
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
				        	//TODO:
				        	//clicking on course text box and hitting enter removes most recent li added
				        	
				        	
				            <%-- Get the input value --%>
				            var courseCode = document.getElementById('course').value;	
				            
				         // Define the regex pattern for the course code
			                var regexPattern = /^[a-zA-Z]{3,4}\s?\d{3,4}$/;
			                
				            if (courseCode.trim() !== ""&& regexPattern.test(courseCode)) {
				            	
				                // Create a new list item
				                var listItem = document.createElement("li");
				                				
				                // Create a new span for the course code
				                var courseCodeSpan = document.createElement("text");
				                courseCodeSpan.style.display = 'block';
				                courseCodeSpan.className = "courseName";

				                
				                
				                var courseText = document.createTextNode(courseCode);

				                courseCodeSpan.appendChild(courseText);

				                
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
				        
				        function isCourseAlreadyAdded(newCourse) {
				            var courseList = document.getElementById("courseList").getElementsByTagName("li");

				            for (var i = 0; i < courseList.length; i++) {
				                var existingCourse = courseList[i].getElementsByClassName("courseName")[0].textContent;

				                if (newCourse === existingCourse) {
				                    alert("Course already added to the list!");
				                    return true;
				                }
				            }

				            return false;
				        }
				    </script>
				    </div>
				</div>

				
			
				<%-- Continue --%>
				 <div class="row">
					<div class="col-md-12 form-group">
						<button type="button" id="continue">Continue</button>
							<script>
							    // Get the button element by its ID
							    var myButton = document.getElementById('continue');
							
							    // Add a click event listener to the button
							    myButton.addEventListener('click', function () {
							    	
							    	if(!validateProgram()){
							    		return;
							    	}
							    	
							    	<%-- Generate seed --%>
							    	
							    	var program = document.getElementById('programName').value;
							    	
							    	var temp = document.getElementsByClassName("courseName");
							    	
							    	var courses = [];
							    								
									
							    	for(var i = 0;i<temp.length;i++){
							    		courses.push(temp[i].textContent);
							    	}
							    	
							    	//sort array so that seed is the same even if courses are inputted in different order
							    	courses.sort();
							    	
							    	console.log(courses);
							    	
									var programSeed = "";
									
									//remove non alphanumeric characters and white space
									program = program.replace(/[^a-zA-Z0-9]/g, '');
									program = program.toUpperCase();
									
									for(var  i = 0;i<program.length;i++){
										programSeed += (program.charCodeAt(i)-47);
									}
									
						
									var courseSeed = "";
							    	
									
									//loop through each course
							    	for(var i = 0;i<courses.length;i++){
							    								    			
						    			//remove non alphanumeric characters and white space
										courses[i] = courses[i].replace(/[^a-zA-Z0-9]/g, '');
						    			
						    			courses[i] = courses[i].toUpperCase();
							    		
							    		//loop through each character of an individual course
							    		for(var  j = 0;j<courses[i].length;j++){							 
											courseSeed += (courses[i].charCodeAt(j)-47);
										}
							    	}
									
							    	
							    	var seed = programSeed + courseSeed;
							    	
							    	//replaces all zeros with threes to stop program from stalling out
							    	seed = seed.replace(/0/g, '3');

							    	
							      // Specify the URL of the page you want to navigate to
							      var newPageUrl = 'recommendations.jsp'; // Replace with your desired URL
							
							      //store seed so that the recommendation page can use it
							      localStorage.setItem("seed", seed);
							      //console.log(seed);
							      
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
