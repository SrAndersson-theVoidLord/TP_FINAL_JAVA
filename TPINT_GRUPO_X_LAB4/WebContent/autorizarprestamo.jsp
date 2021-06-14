<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.logging.ConsoleHandler"%>
<%@page import="java.io.Console"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.MathContext"%>
<%@page import="com.sun.glass.ui.Pixels.Format"%>
<%@page import="java.util.Currency"%>
<%@page import="Entidades.Prestamo"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.math.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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


<script>
	$(document)
			.ready(
					function() {
						$('#tabla_prestamos')
								.DataTable(
										{
											autoWidth : true,
											lengthChange : false,
											"language" : {
												"sProcessing" : "Procesando...",
												"sLengthMenu" : "Mostrar _MENU_ registros",
												"sZeroRecords" : "No se encontraron resultados",
												"sEmptyTable" : "No hay prestamos para autorizar",
												"sInfo" : "Mostrando _START_ de _END_ de un total de _TOTAL_ registros",
												"sInfoEmpty" : "Mostrando 0 de 0 de un total de 0 registros",
												"sInfoFiltered" : "(filtrado de un total de _MAX_ registros)",
												"sInfoPostFix" : "",
												"sSearch" : "Buscar:",
												"sUrl" : "",
												"sInfoThousands" : ",",
												"sLoadingRecords" : "Cargando...",
												"oPaginate" : {
													"sFirst" : "Primero",
													"sLast" : "Último",
													"sNext" : "Siguiente",
													"sPrevious" : "Anterior"
												},
												"oAria" : {
													"sSortAscending" : ": Activar para ordenar la columna de manera ascendente",
													"sSortDescending" : ": Activar para ordenar la columna de manera descendente"
												},
												"buttons" : {
													"copy" : "Copiar",
													"colvis" : "Visibilidad"
												}
											}

										});
					});
</script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="MenuAdmin.html"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="sidebarAdmin.html"></jsp:include>
	
		<div id="layoutSidenav_content">

			<main>

			<%if(request.getAttribute("admin")== ""){
				response.sendRedirect("AccesoDenegado.jsp");
			}%>
			
			

			<div class="container-fluid">
	<a href="index_admin.jsp" style="color: #fcb045;" class="nav-link">Volver a Inicio</a>
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1 class="display-3">Autorización de Prestamos</h1>
					</div>
				</div>
				


				
				<%
					if (request.getAttribute("logautorizar") != null) {
						JOptionPane.showMessageDialog(null, "La solicitud se ha Aprobado");

					}
				if (request.getAttribute("logrechazo") != null) {
					JOptionPane.showMessageDialog(null, "La solicitud se ha Rechazado");

				}
				%>

				<%
					ArrayList<Prestamo> lista = null;
					if (request.getAttribute("listaP") != null) {
						lista = (ArrayList<Prestamo>) request.getAttribute("listaP");
				%>

				<table id="tabla_prestamos">
					<thead>
						<tr>
							<th scope="col">Prestamo</th>
							<th scope="col">Cuenta</th>
							<th scope="col">Importe</th>
							<th scope="col">Importe a Pagar</th>
							<th scope="col">Plazo(Meses)</th>
							<th scope="col">Monto Mensual</th>
							<th scope="col">Saldo Restante</th>
							<th scope="col">Cuotas Restantes</th>
							<th scope="col">Fecha Alta</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<%
							if (lista != null)
									for (Prestamo pres : lista) {
						%>
						<tr>
							<td><%=pres.getNro_Prestamo()%></td>
							<td><%=pres.getNro_Cuenta()%></td>
							<td><%=pres.getImporte_Prestamo()%></td>
							<td><%=pres.getImporte_Total_Pagar()%></td>
							<td><%=pres.getPlazo_Meses()%></td>
							<td><%=pres.getMonto_Mensual()%></td>
							<td><%=pres.getSaldo_Restante()%></td>
							<td><%=pres.getCuotas_Restantes()%></td>
							<td><%=pres.getFecha_Alta()%></td>
							<td>
						
						
								<%
									int nroprestamo = pres.getNro_Prestamo();

									String prestc = "A"+ pres.getNro_Prestamo();
						
									String prestconcat ="#A"+pres.getNro_Prestamo();
									
									String prestc2 = "B"+ pres.getNro_Prestamo();
									
									String prestconcat2 ="#B"+pres.getNro_Prestamo();
								%>
							
							
							<a><button type="button" class="btn btn-success"
										data-toggle="modal" data-target="<%=prestconcat%>">
										Autorizar</button></a> <a><button type="button" class="btn btn-danger"
										data-toggle="modal" data-target="<%=prestconcat2%>">
										Rechazar</button></a></td>
						</tr>
			
	<div class="modal fade" id="<%=prestc%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Autorizar Cuenta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            Desea Autorizar el prestamo Nro: <%=pres.getNro_Prestamo()%> 
 
      </div>
      <div class="modal-footer">
      
       <a class="btn btn-success"href="ServletPrestamos?prestamoautorizar=<%=pres.getNro_Prestamo()%>&cash=<%=pres.getImporte_Prestamo()%>&cuenta=<%=pres.getNro_Cuenta()%>"> Autorizar </a>
       
       
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        
      
      </div>
    </div>
  </div>
</div>

	<div class="modal fade" id="<%=prestc2%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Autorizar Cuenta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            Desea Rechazar el prestamo Nro: <%=pres.getNro_Prestamo()%> 
 
      </div>
      <div class="modal-footer">
              <a class="btn btn-danger"href="ServletPrestamos?prestamorechazar=<%=pres.getNro_Prestamo()%>"> Rechazar </a>
       
       
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        
      
      </div>
    </div>
  </div>
</div>

						<%
							}
						%>
					</tbody>
				</table>
				<%
					}
					else
					{
						JOptionPane.showMessageDialog(null, "No hay prestamos para autorizar");
					}
				%>




			</div>
						<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid">
				<div class="float-right">
					<div class="text-muted">Logueado como ${userconect.usuario}</div>
				</div>
			</div>
			</footer>
		</div>
	
	</div>


	</main>




</body>

</html>