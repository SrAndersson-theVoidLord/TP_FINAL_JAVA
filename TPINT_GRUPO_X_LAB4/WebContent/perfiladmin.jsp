
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Entidades.Cuenta"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>FRGPbank</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap.grid.min.css">
  
	<link rel="stylesheet" href="css/all.min.css">
	<!-- logo y estilos css personales -->
	<link rel="stylesheet" media="screen" href="css/estilos_clientes.css">
  <link rel="stylesheet" media="screen" href="css/simple-sidebar.css">
	<link rel="icon" type="text/css" href="img/moneda-oro.ico">

	<!-- Fuentes de Google -->
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inicio Administrador</title>
<link rel="stylesheet" href="css/estilos_index_admin.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.grid.min.css">
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/all.min.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>


</head>
<body class="sb-nav-fixed">
	<jsp:include page="MenuAdmin.html"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="sidebarAdmin.html"></jsp:include>
		<div id="layoutSidenav_content">

			
			<main>


				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1 class="display-3 text-center">Datos Personales</h1>
					</div>
				</div>

<div class="foto-perfil">

		 
		 <img src="img/useruni.png">
		
		
        <!-- <img src="img/man.png">  -->
      </div> 
	 
      <div class="caja-datos">
        <div class="nombre-usuario">
          <label for="Nombre">${userconect.nombre} </label>
          <label for="Apellido">${userconect.apellido} </label><br/>
          <label for="Localidad">${userconect.localidad}</label>
          <label for="Provincia"> ${userconect.provincia}</label>
        </div>
      </div>
      
<div class="container-grid">

<div class="caja-datos-det">

    <label class="grid-item" for="DNI"><i class="fas fa-passport"></i> ${userconect.dni}</label>
    <label class="grid-item" for="CUIL"><i class="fas fa-id-badge"></i> ${userconect.cuil}</label>
    <label class="grid-item" for="Sexo"><i class="fas fa-venus-mars"></i> ${userconect.sexo}</label>
    <label class="grid-item" for="Nacionalidad"><i class="fas fa-map-marker-alt"></i> ${userconect.nacionalidad}</label>
    <label class="grid-item" for="Direccion"><i class="fas fa-home"></i> ${userconect.direccion}</label>
    <label class="grid-item" for="Fecha_Nacimiento"><i class="fas fa-calendar-alt"></i> ${userconect.fecha_nac} </label>
    <label class="grid-item" for="Telefono"><i class="fas fa-phone"></i> ${userconect.telefono}</label>
    <label class="grid-item" for="Email"><i class="fas fa-envelope"></i> ${userconect.mail}</label>

  	</div>
	</div>

  </div> <!-- fin del main perfil -->

		</main>
		<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid">
			<div class="float-right">
				<div class="text-muted">Grupo 1</div>
			</div>
		</div>
		</footer>
	</div>
 <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<!-- JavaScript Boorstrap -->	
	<script type="text/javascript" src="js/all.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="js/popper.min.js"></script>
	<script type="text/javascript" src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>



  <!-- Scripts -->
  <!-- Toggle menu -->
  <script>
    $( document ).ready(function() {

    $(".foto-perfil").css({"opacity":"1"});
    $(".caja-datos").css({"opacity":"1"});

    window.addEventListener('scroll',function(){

	var altura = window.innerHeight/1.3;
	var distancia = $('.caja-datos-det')[0].getBoundingClientRect().top;


	if(distancia <= altura){
	$(".caja-datos-det").css({"transform": "translateY(-10%)","opacity":"1"});
	}
	else{

  $(".caja-datos-det").css({"transform": "translateY(0%)","opacity":"0"});
	}


 });// fin funcion scroll
    
	}); // fin doc

  </script>

</body>
</html>