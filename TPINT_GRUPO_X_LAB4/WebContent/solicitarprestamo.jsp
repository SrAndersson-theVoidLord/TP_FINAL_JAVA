<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Cuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>FRGPbank</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
  <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

  
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
    
    
    <div class="main-prestamos">

<div class="titulo-prestamos">
  <h1>Solicitar prestamo</h1>
</div>
  <form action="ServletPrestamos" method="get">
   <div class="monton-solic">
    <h3>Monto solicitado</h3>
    
    
    		
    
    
    <input class="input-1" type="text" id="montoSolicitado" name="montoSolic" placeholder="$0.00,00" onkeypress="return ((event.charCode >= 46 && event.charCode <= 57 ))"><br><br>

				<%
					ArrayList<Cuenta> lista = null;
					if (request.getAttribute("listaCuentas") != null) {
						lista = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
					}
				%>
    
							<h4>Cuenta destino</h4>


 						 <div class="form-group w-25 p-3" style="margin:0px auto">
    					<select name="numCuenta" class="form-control" id="CuentaDescuento">
      
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

<div class="form-group w-25 p-3" style="margin:0px auto" >
<h4>Cuotas</h4>
    <select name="cuotasSolic" class="form-control" id="selectCuotas">
      <option value="3">3</option>
      <option value="6">6</option>
      <option value="12">12</option>
      <option value="18">18</option>
      <option value="24">24</option>
    </select>
  </div>

    <div class="opcion-envio">
  <button class="btn-calcular">Calcular!</button>
  </div> 

   </div>
   
   			<!-- alerta para monto vacio -->
			<div class="alert alert-success" role="alert" style="display:none">
				Completar monto!
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
   

   <!-- una vez que hacen click en el boton calcular se despliega la siguiente seccion -->
	
   <div id="simulador" style="display:none">
    <div>
     <h4>Monto por cuota:</h4><span name="montoCuota" id="montocuota"></span> 
    </div>
    <div>
     <h4>Plazo:</h4><span name="cuotas" id="cuotas"></span> 
    </div>
     <div>
     <h4>Monto final a pagar:</h4><span name="montoFinal" id="montofinal"></span>  
     <label name="montoFinalServlet" type="text" id="montoFinalServlet" style="display:none"></label>  
     </div>
      <br>
     <div class="opcion-envio">
     <input type="submit" style="opacity:1" name="btnSolicitar" class="btn-solicitar-prestamo" value="Solicitar">
  <button class="btn-volver">Volver!</button>
  </div>
   </div>
   </form>
  </div>
    
    
    
    


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
    $(".btn-calcular").click(function(e) {
      e.preventDefault();
      

      if($("#simulador").css("display")=="none"){

      
        $("#simulador").fadeIn(1000);
      
      $("html, body").animate({
    scrollTop: 800
}, 1200);
      }
      
      // calculo la cuota y el monto final //
      var montoSolicitado = parseFloat(document.getElementById("montoSolicitado").value);
      var cuotas = document.getElementById("selectCuotas").value;
      var montoFinal = montoSolicitado*2;
      var cuotaMensual = montoFinal/cuotas;
      
      
      var S_MontoFinal = montoFinal.toFixed(2).toString();
      var S_CuotaFinal = "$"+cuotaMensual.toFixed(2).toString();
      var S_Plazo = cuotas.toString()+" meses";
      
      $("#montocuota").text(S_CuotaFinal);
      $("#montofinal").text(S_MontoFinal);
      $("#cuotas").text(S_Plazo);
      
      // envio tambien el numero limpio para usar en el servlet //
      
      $("#montoCuotaServlet").text(cuotaMensual.toFixed(2).toString());
      $("#montoFinalServlet").text(montoFinal.toFixed(2).toString());
      
      
      

    });

    $(".btn-volver").click(function(e) {
      e.preventDefault();
      
      $("html, body").animate({
        scrollTop:100
    }, 1200); 
      
      $("#simulador").fadeOut(900);

    });

  </script>
 
 
</body>
</html>