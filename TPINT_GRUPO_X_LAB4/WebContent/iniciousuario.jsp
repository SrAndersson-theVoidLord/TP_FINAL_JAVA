<%@page import="Entidades.Movimientos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Cuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>FRGPbank</title>
	<meta http-equiv="Content-Type" content="texthtml; charset=UTF-8">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-grid.min.css">
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
    
    				<%
					Cuenta cuentaPrincipal = new Cuenta();
					if (request.getAttribute("cuentauno") != null) {
						cuentaPrincipal =(Cuenta)request.getAttribute("cuentauno");
					}
					%>

    <div class="tabla-main">
      <!-- header de cuentas  -->
  <header class="header-cuentas">
    <div class="item-header-cuentas">
       <h1>CA $<%=cuentaPrincipal.getSaldo_Cuenta()%></h1>
        <h2>N°<%=cuentaPrincipal.getNro_Cuenta()%></h2>
        <h3>CBU <%=cuentaPrincipal.getCBU_Cuenta()%></h3>
  </div>
  </header>

<!-- Filtro de los movimientos -->
  <div class="mov">
    
<div class="movimientos">
    <h3>Movimientos</h3>


  </div>
  </div>

<!-- cuentas --> 

<div class="tabla-container">
  
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="ServletMovimientos?cuentauno=1" style="color: #000">CUENTA 1</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="ServletMovimientos?cuentados=1" style="color: #000">CUENTA 2</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="ServletMovimientos?cuentatres=1" style="color: #000">CUENTA 3</a>
  </li>
</ul>

<!-- tabla con historia -->
				<%
					ArrayList<Movimientos> lista = null;
					if (request.getAttribute("listaMov") != null) {
						lista = (ArrayList<Movimientos>) request.getAttribute("listaMov");
					}
				%>

<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Codigo Movimiento</th>
      <th scope="col">Fecha</th>
      <th scope="col">Descripción</th>
      <th scope="col">Importe</th>
      
    </tr>
  </thead>
  <tbody>
 						 <%
							if (lista != null)
								for (Movimientos movs : lista) {
						 %>
    <tr>
      						<td><%=movs.getCodMovimiento()%></td>
							<td><%=movs.getFechaMov()%></td>
							<td><%=movs.getMensaje()%></td>
							<td><%=movs.getImporte()%></td>
    </tr>
   						 <%
							}
						 %>
  </tbody>
</table>
</div>  <!-- fin tabla container -->  
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
  <!-- Toggle menu -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });

  </script>
</body>
</html>