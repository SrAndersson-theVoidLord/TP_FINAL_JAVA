<%@page import="Entidades.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Trustbank</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap.grid.min.css">
  
	<link rel="stylesheet" href="css/all.min.css">
	<!-- logo y estilos css personales -->
	<link rel="stylesheet" media="screen" href="css/estilos_clientes.css">
  <link rel="stylesheet" media="screen" href="css/simple-sidebar.css">
	<link rel="icon" type="text/css" href="img/logofenix.ico">

	<!-- Fuentes de Google -->
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

  
</head>
<body>
<!-- header -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-toggleable-sm">
  <a class="navbar-brand" href="ServletMovimientos?cuentauno=1">
    <img src="img/logofenix.png" width="77" height="77" class="d-inline-block align-center" alt="Logo banco">
    T r u s t b a n k
  </a>
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <div class="navbar-nav ml-auto ml-auto text-center">
      <a class="item-nav" href="usuario.html">HOME</a>
<a class="item-nav" href="ServletUsuario?cerrarSession=1">CERRAR SESIÓN</a>
      <!-- meter icono con usuario logueado -->
    </div>
  </div>
</nav>

<!-- side bar con opciones -->

<div class="d-flex" id="wrapper">

<!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading"><i class="fas fa-user-circle"></i>
		<a class="navbar-brand" name="usuarioConectado" href="perfilusuario.jsp" name="nuser">${userconect.usuario}</div>
      <div class="list-group list-group-flush">
        <a href="ServletMovimientos?cuentauno=1" class="list-group-item list-group-item-action bg-light"><i class="fas fa-wallet"></i> Cuentas</a>
        <a href="ServletCuentas?cuenta=1" class="list-group-item list-group-item-action bg-light"><i class="fas fa-exchange-alt"></i>
         Transferencias</a>
        <a href="prestamos.jsp" class="list-group-item list-group-item-action bg-light"><i class="fas fa-money-bill-alt"></i> Prestamos</a>
        <a href="ServletUsuario?perfil=1" class="list-group-item list-group-item-action bg-light"><i class="fas fa-address-card"></i> Información personal</a>
      </div>
    </div>
    <!-- CONTENIDO PRINCIPAL -->

     
    <div class="main-perfil">
      <h1>Datos personales</h1>

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



  </div> <!-- fin del contenido principal -->
  
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