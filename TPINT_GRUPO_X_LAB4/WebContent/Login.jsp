		<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Iniciar Sesión</title>
<link rel="stylesheet" href="css/master.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.grid.min.css">
<link rel="stylesheet" href="css/all.min.css">
</head>
<body>


	<div class="login-container">
		<div class="login-box">
			<!-- <img src="img/logo.png" class="avatar" alt="Avatar Image"> -->
			<h3 class="text-center pb-4">Ingreso</h3>
			<form class="mt-4 rounded" action="ServletUsuario?btnIngresar" method="post">
				<!-- USERNAME INPUT -->
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span>
					</div>
					<input type="text" id="inuser" name="usuario" class="form-control"
						placeholder="Usuario" required >
				</div>
				<br><br>
				<!-- PASSWORD INPUT -->
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-key"></i></span>
					</div>
					<input type="password" id="inpass" name="contrasenia"
						class="form-control" placeholder="Contraseña" required>
				</div>
				<br>
				 <input type="submit" id="btning" name="btnIngresar"
					class="btn w-100 btn-primary rounded-pill mt-3" value="Ingresar">
			</form>
		</div>
	</div>


	<!-- jQuery -->

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<!-- JavaScript Boorstrap -->
	<script type="text/javascript" src="js/all.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
	<script type="text/javascript">
	
	
	$("#inuser").hover(function(e) {
      	e.preventDefault();
      	$("#lbluser").css("opacity", "1");
		if($('#inuser').val() == ""){

		$("#lbluser").css("opacity", "1");
		
	}
	
	else{
		
		$("#lbluser").css("opacity", "0");
	}
	
  	 });
  	
  	
  	$("#inpass").hover(function(e) {
      	e.preventDefault();
      	$("#lblpass").css("opacity", "1");
	if($('#inpass').val() == ""){
		$("#lblpass").css("opacity", "1");
		
		
	} else
		{
		
		$("#lblpass").css("opacity", "0");
		
		
		}
	
});
  	
	
	</script>




</body>
</html>
