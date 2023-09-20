<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<title>Prijava na portal</title>
	</head>
	<body>
			<div class="container" style="margin-top: 7%;">
			<div class="row justify-content-center align-items-center">
        		<div class="login-form" style="width: 40%;">   	
        			<h1>Prijava na portal</h1> <br>
        			<form method="post" action="loginServlet">
						  <div class="mb-3">
						    <label for="username" class="form-label">Korisničko ime</label>
						    <input type="text" name="username" class="form-control" id="username" required>
						  </div>
						  <div class="mb-3">
						    <label for="password" class="form-label">Lozinka</label>
						    <input type="password" name="password" class="form-control" id="password" required>
						  </div>
						  <div class="mb-3 form-check">
						    <input type="radio" class="form-check-input" name="type" value="Administrator" id="usertype1">
						    <label class="form-check-label" for="usertype1">Administrator</label>
						  </div>
						  <div class="mb-3 form-check">
						    <input type="radio" class="form-check-input" name="type" value="Driver" id="usertype2">
						    <label class="form-check-label" for="usertype2">Vozač</label>
						  </div>
						  <button type="submit" value="Prijavi se na portal" class="btn btn-outline-dark">Prijavi se na portal</button>
					</form>
   				</div>
   			</div>
   			</div>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
	</body>
</html>