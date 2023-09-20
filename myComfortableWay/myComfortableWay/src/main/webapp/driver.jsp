<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<title>Vozač</title>
	</head>
	<body>
    	<div class="container" style="margin-top: 2%;">
			<div class="row justify-content-center mb-4 align-items-center">
        		<div class="" style="width:40%"> 
        		    <h1>Pregled podataka</h1> <br> 
        			<form method="post" action="addSituationServlet">
						  <div class="mb-3">
							    <label for="countryFilter" class="form-label">Unesi naziv države</label>
							    <input type="text" name="countryFilter" class="form-control" id="countryFilter" required>
						  </div>
					 <!-- <button type="submit" value="Filtriraj" class="btn btn-outline-dark">Filtriraj</button> -->
					</form>
        		</div>
			</div>	 
	       <table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">Naziv granice</th>
			      <th scope="col">Država</th>
			      <th scope="col">Prosečno vreme čekanja na srpskoj granici</th>
			      <th scope="col">Prosečno vreme čekanja na susednoj strani granice</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="crossing" items="${crossings}">
			    	<tr>
			            <td>${crossing.name}</td>
			            <td>${crossing.country}</td>
			            <td>${crossing.waitingSerbia}</td>
			            <td>${crossing.waitingOtherCountry}</td> 
			        </tr>
			  	</c:forEach>
			  </tbody>
			</table>
		</div>
    <button type="submit" value="Logout" class="logout-btn btn btn-outline-danger btn-sm">Odjavi se iz portala</button>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    </body>
</html>