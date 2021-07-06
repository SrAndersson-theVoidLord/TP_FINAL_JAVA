<%@page import="Entidades.Movimientos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Cuenta"%>
<%@ page language="java" contentType="text/html;charset=ISO-8859-1"
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

  
</head>
<body>
<!-- header -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-toggleable-sm">
  <a class="navbar-brand" href="index.jsp">
    <img src="img/moneda-oro.jpg" width="77" height="77" class="d-inline-block align-center" alt="Logo banco">
    F R G P b a n k
  </a>
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <div class="navbar-nav ml-auto ml-auto text-center">
       <a class="item-nav" href="index.jsp">INICIO</a>
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
				
						
<div class="main-tranfer">
  <h1>Transferencias</h1> 
  <div class="contenido-principal">
      <h4>¡Error!</h4>

		<h4>Verifique que el monto a transferir sea mayor a $4000</h4>
		<h4>y que la cuenta de destino no sea la misma</h4>
    <a href="ServletCuentas?cuenta=1"> <input type="submit" style="opacity:1" name="btnEnviarTransfer" class="btn-solicitar-prestamo" value="Volver"></a>
  
    </div>    <!-- cierre contenido principal -->   
  </div> <!-- cierre main transfer -->

  </div>

<!-- jQuery -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!-- JavaScript Boorstrap -->	
	<script type="text/javascript" src="js/all.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>

  <!-- Scripts -->
  
  <script>

    $( document ).ready(function() {

  let btnCuentaPropia = $('a[name=btncp]');
  let btnCuentaAjena = $('a[name=btnca]');
  
     // opcion 2 , le cambiamos la opacidad //
   $('a[name=btncp]').click(function(e) {
      e.preventDefault();

      // ingreso el sector y bajo el scroll
if($(".seccion-cuentas").css("display")=="none"){

      $(".seccion-cuentas").fadeIn(1000);
      $("html, body").animate({
    scrollTop: 600
}, 1200);
      }
      
      // ingreso lo componentes cambiando la opacidad
      $(".btn-envio").css({"opacity":"1"});
      $(".cbu").css({"opacity":"0"});
      $(".cbu").css({"display":"none"});
      $("#envioCuentaPropia").css({"opacity":"1"});
      $("#envioCuentaPropia").css({"display":"block"});
      


    });

    $('a[name=btnca]').click(function(e) {
      e.preventDefault();
        // ingreso el sector y bajo el scroll
if($(".seccion-cuentas").css("display")=="none"){

      $(".seccion-cuentas").fadeIn(1000);
      $("html, body").animate({
    scrollTop: 600
}, 1200);
      }
      // ingreso lo componentes cambiando la opacidad
       $(".btn-envio").css({"opacity":"1"});
       $("#envioCuentaPropia").css({"opacity":"0"});
       $("#envioCuentaPropia").css({"display":"none"});
       $(".cbu").css({"opacity":"1"});
       $(".cbu").css({"display":"block"});
       
      
});

});// fin doc
    

  </script>
</body>
</html>