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
  <a class="navbar-brand" href="ServletMovimientos?cuentauno=1">
    <img src="img/moneda-oro.jpg" width="77" height="77" class="d-inline-block align-center" alt="Logo banco">
    F R G P b a n k
  </a>
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <div class="navbar-nav ml-auto ml-auto text-center">
       <a class="item-nav" href="index.jsp">HOME</a>
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
  <form action="ServletMovimientos" method="get">
      <h4>Transfiriendo desde</h4>

		<h4>Cuenta origen</h4>
				<%
					ArrayList<Cuenta> lista = null;
					if (request.getAttribute("listaCuentas") != null) {
						lista = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
					}
				%>
		    
    					
    
      					   <div class="form-group w-25 p-3" style="margin:0px auto">
    <select name="cuentaOrigen" class="form-control" id="CuentaDescuento">
      
      						<%
							if (lista != null)
								for (Cuenta c : lista) {
						 	%>
      <option><%=c.getNro_Cuenta()%></option>
      
      
      						<%
							}
						 	%>
						 	
      
    </select>
  </div>
  
      
      					
  
  						 
<br>
<!-- monton a enviar -->
<div class="monto">
  <h4>Monto a enviar</h4>
  <!-- Dentro del place Holder va el monto total disponible de la cuenta que selecciono -->
  <input type="text" name="monto-transfer" placeholder="$3.000,00">
</div>
<br>
<!-- Destinatario -->

<h3>¿A quién querés enviarle dinero?</h3> <br>
  <div class="opcion-envio">
  <a class="btn-envio-cp" name="btncp">Cuentas propias</a>
  <a class="btn-envio-cp" name="btnca">Adherir cuenta</a>
  </div>
  
<!-- seccion que aparece luego de seleccionar tipo de cuenta -->

<section class="seccion-cuentas">

  <!-- envio a otra cuenta con CBU -->

<div class="cbu" style="display: none">
  <h4>CBU</h4>
  <input type="text" name="cbu-envio" placeholder="CBU">
</div> 


<!-- envio a cuenta propia -->
<div class="form-group w-25 p-3" style="margin:0px auto" id="envioCuentaPropia">
    <select name="cuentaDestino" class="form-control" id="CuentaDescuento">
      
      						<%
							if (lista != null)
								for (Cuenta c : lista) {
						 	%>
      
      <option><%=c.getNro_Cuenta()%></option>
      
      						<%
							}
						 	%>
						 	
      
    </select>
  </div>


<!-- Boton de envio -->


	<div class="opcion-envio">
     <input type="submit" style="opacity:1" name="btnEnviarTransfer" class="btn-solicitar-prestamo" value="Enviar">
  <button class="btn-volver">Volver!</button>
  </div>
  

</section>


</form>
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