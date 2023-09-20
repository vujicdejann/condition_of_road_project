<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<title>Administrator</title>
	</head>
	<body>
		 <div class="container" style="margin-top: 2%;">
			<div class="row justify-content-center align-items-center">
        		<div class="add-form" style="width: 40%;">   	
        			<h1>Unos novih podataka</h1> <br>
        			<form method="post" action="addSituationServlet">
						  <div class="mb-3">
						    <label for="crossingName" class="form-label">Naziv granice</label>
						    <input type="text" name="username" class="form-control" id="crossingName" required>
						  </div>
						  <div class="mb-3">
						    <label for="country" class="form-label">Država</label>
						    <input type="text" name="password" class="form-control" id="country" required>
						  </div>
						  <div class="mb-3 form-check">
						    <input type="checkbox" value="passable" class="form-check-input" name="type" value="Administrator" id="status">
						    <label class="form-check-label" for="status">Prohodni</label>
						  </div>
						  <div class="mb-3 form-check">
						    <input type="checkbox" value="closed" class="form-check-input" name="type" value="Administrator" id="status">
						    <label class="form-check-label" for="status">Trenutno zatvoren</label>
						  </div>
						  <div class="mb-3 form-check">
						    <input type="checkbox" value="slow" class="form-check-input" name="type" value="Administrator" id="status">
						    <label class="form-check-label" for="status">Usporen saobraćaj</label>
						  </div>
						  <div class="mb-3">
						    <label for="waitingSerbia" class="form-label">Prosečno vreme čekanja na srpskoj granici (minuti)</label>
						    <input type="number" name="waitingSerbia" class="form-control" id="waitingSerbia" required>
						  </div>
						   <div class="mb-3">
						    <label for="waitingOtherCountry" class="form-label">Prosečno vreme čekanja na susednoj strani granice (minuti)</label>
						    <input type="number" name="waitingOtherCountry" class="form-control" id="waitingOtherCountry" required>
						  </div>  
						  <button type="submit" value="Dodaj podatak" class="btn btn-outline-dark">Sačuvaj podatke</button>
					</form>
   				</div>
   				</div>
   			</div>
	     <button type="submit" value="Logout" class="logout-btn2 btn btn-outline-danger btn-sm">Odjavi se iz portala</button>
		 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
	</body>
</html>