<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Cuenta"%>
<%@page import="Entidades.Prestamo"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.Date"%>

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
      <a class="item-nav" href="Login.jsp">CERRAR SESIÓN</a>
      <!-- meter icono con usuario logueado -->
    </div>
  </div>
</nav>

<!-- side bar con opciones -->

<div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading"><i class="fas fa-user-circle"></i>
		<a class="navbar-brand" href="perfilusuario.jsp">${userconect.usuario}</div>
      <div class="list-group list-group-flush">
        <a href="ServletMovimientos?cuentauno=1" class="list-group-item list-group-item-action bg-light"><i class="fas fa-wallet"></i> Cuentas</a>
        <a href="ServletCuentas?cuenta=1" class="list-group-item list-group-item-action bg-light"><i class="fas fa-exchange-alt"></i>
         Transferencias</a>
        <a href="prestamos.jsp" class="list-group-item list-group-item-action bg-light"><i class="fas fa-money-bill-alt"></i> Prestamos</a>
        <a href="perfilusuario.jsp" class="list-group-item list-group-item-action bg-light"><i class="fas fa-address-card"></i> Información personal</a>
      </div>
    </div>

    <!-- CONTENIDO PRINCIPAL -->

    
    <div class="main-prestamos">
  <h1>Pagar prestamo</h1>

<!-- Posible filtro -->
  <div class="mov">
    
<div class="movimientos">
    <h3>Listado de prestamos</h3>


<!-- 
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Ordenar
  </button>
  <div class="dropdown-menu text-center" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Todos</a>
    <a class="dropdown-item" href="#">Fecha de venc</a>
    <a class="dropdown-item" href="#">Cuota</a>
  </div>
</div> -->



  </div>

  </div>
  
  <!-- tabla con prestamos -->
  <div class="tabla-container">


<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Número de prestamo</th>
      <th scope="col">Próximo vencimiento</th>
      <th scope="col">valor cuota</th>
      <th scope="col">Saldo restante</th>
      <th scope="col">Cuotas restantes</th>
      <th scope="col">Cuota a pagar</th>
      <th scope="col">Cuenta de pago</th>
      <th scope="col"></th>
      
    </tr>
  </thead>
 				 <%
					ArrayList<Prestamo> listaPres = null;
					if (request.getAttribute("listaPrestamos") != null) {
						listaPres = (ArrayList<Prestamo>) request.getAttribute("listaPrestamos");
					}
				%>
  <tbody>

  							<%
							if (listaPres != null)
								for (Prestamo p : listaPres) {
						 	%>
						 	  <form action="ServletPrestamos" method="get">
						 	<%
      						Date fecha  = p.getFecha_Alta();
						 	int dias = (int)(p.getPlazo_Meses()-p.getCuotas_Restantes()+1)*30;
						 	 Calendar calendar = Calendar.getInstance();
						 	 calendar.setTime(fecha); // Configuramos la fecha que se recibe
      						 calendar.add(Calendar.DAY_OF_YEAR, dias);  // numero de días a añadir, o restar en caso de días<0
      						 
      						 calendar.getTime(); // Devuelve el objeto Date con los nuevos días añadidos
      						 
      						SimpleDateFormat dateOnly = new SimpleDateFormat("dd/MM/yyyy"); 
      						dateOnly.format(calendar.getTime()); 
      						calendar.getTime().toLocaleString();
      						
     						 %>
    <tr>
    						
							<%

							Float montoMensual = null;
							
							if (p.getCuotas_Restantes() == 1) montoMensual = p.getSaldo_Restante();
							else if(p.getCuotas_Restantes() != 1) montoMensual = p.getMonto_Mensual();	
						 	%>
						 	
						 	
						 	
     
      
      <th scope="row" name="nroPrestamo"><%=p.getNro_Prestamo()%></th> 
      <td ><%=dateOnly.format(calendar.getTime())%></td>
      <td name="montoMensual">$<%=montoMensual%></td>
      <td name="saldoRestante">$<%=p.getSaldo_Restante()%></td> 
      <td name="cuotasRestantes"><%=p.getCuotas_Restantes()%></td>
      <td name="cuotaPagada"><%=p.getPlazo_Meses()-p.getCuotas_Restantes()+1%></td>
      
      <input type="text" style="display:none" name="numPrest" value="<%=p.getNro_Prestamo()%>">
      <input type="text" style="display:none" name="cuotaMensual" value="<%=p.getMonto_Mensual()%>">
      
      <input type="text" style="display:none" name="SaldoRest" value="<%=p.getSaldo_Restante()%>">
      
      <input type="text" style="display:none" name="cuotasRest" value="<%=p.getCuotas_Restantes()%>">
      <input type="text" style="display:none" name="cuota_a_pagar" value="<%=p.getPlazo_Meses()-p.getCuotas_Restantes()+1%>">
      
      						
      					
      
      <td>
     			 <%
					ArrayList<Cuenta> lista = null;
					if (request.getAttribute("listaCuentas") != null) {
						lista = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
					}
				%>
    				
      
        <div class="form-group" style="width: 110px">
    <select name="cuentaDesc" class="form-control" id="CuentaDescuento">
      
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
  
</td>
      <!-- inicia parte de boton pagar  <button type="button" class="btn btn-dark">Pagar</button> -->
     
   
     <td>
								
			<a><button type="button" class="btn btn-danger" name ="<%=p.getNro_Prestamo()%>" id="<%=p.getNro_Prestamo()%>" data-toggle="modal" data-target="#modalPrestamo<%=p.getNro_Prestamo()%>">Pagar</button></a>

	</td>
</tr>
						
						
						
 <div class="modal fade" id="modalPrestamo<%=p.getNro_Prestamo()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pagar prestamo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      Desea pagar la cuota  <%=p.getPlazo_Meses()-p.getCuotas_Restantes()+1%>? <br>
       
       El monto de la misma es $<%=montoMensual%>

      </div>
      <div class="modal-footer">
       
       <input type="submit" class="btn btn-danger" name="btnPagarPrestamo" value="Confirmar">
       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        
      
      </div>
    </div>
  </div>
</div>

  </form>     
      
    	        <%
							}
						 	%>				
      
      

      
           
      <!-- finaliza parte de boton pagar -->
      
      

    
  				

  </tbody>
  
</table>


    

    
  </div> <!-- fin tabla container -->

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
  <script type="text/javascript" src="js/popper.min.js"></script>
	<script type="text/javascript" src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>

  <!-- Scripts -->

</body>
</html>