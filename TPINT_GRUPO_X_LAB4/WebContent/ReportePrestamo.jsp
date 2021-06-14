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
												"sEmptyTable" : "Ningún dato disponible en esta tabla",
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

	
			<div class="container-fluid">
	<a href="index_admin.jsp" style="color: #fcb045;" class="nav-link">Volver a Inicio</a>
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1 class="display-3">Reporte de Prestamos</h1>
					</div>
				</div>
				<%
					float mes = 0;

					if (request.getAttribute("mensual") != null) {
						mes = (Float) request.getAttribute("mensual");
					}

					float anual = 0;

					if (request.getAttribute("anual") != null) {
						anual = (Float) request.getAttribute("anual");
					}

					float total = 0;

					if (request.getAttribute("total") != null) {
						total = (Float) request.getAttribute("total");
					}
				%>



				<div class="container" >
					<div class="row">
						<div class="col">
							<div class="input-group mb-1">

								<div class="col" >
									<button type="button" class="btn" style="background-color: #fcb045;"
										data-toggle="modal" data-target="#ReporteMensual">
										Ingreso Mes Vigente</button>
									
									<button type="button" class="btn" style="background-color: #fcb045;"
										data-toggle="modal" data-target="#ReporteAnual">
										Ingreso Anual</button>

									<button type="button" class="btn" style="background-color: #fcb045;"
										data-toggle="modal" data-target="#ReporteTotal">
										Importe Total Prestamos</button>
									
									<button type="button" class="btn" style="background-color: #fcb045;"
										data-toggle="modal" data-target="#ReporteFechas">
										Prestamos Entre Fechas</button>
								</div>
							</div>


						</div>
					</div>
				</div>
				<%
				
				if(request.getAttribute("error") != null){
				JOptionPane.showMessageDialog(null,"Intente nuevamente seleccionando todos los campos");
					
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
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
				<%
					}
				%>





				<div class="modal fade" id="ReporteMensual" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Ingreso Mes
									Actual</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>


							<div class="modal-body">

								El ingreso de este mes será de: $
								<%
								DecimalFormat df = new DecimalFormat(".00");
							%>
								<%=df.format(mes)%>

							</div>

							<div class="modal-footer">
								<a class="btn btn-info" href="ServletPrestamos?mes=mes"> Ver
									en Detalle </a> <a class="btn btn-secondary"
									href="ServletPrestamos?reporte=report"> Aceptar </a>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="ReporteAnual" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Ingreso Año
									Actual</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								El Ingreso de este año será de: $

								<%=df.format(anual)%>
							</div>
							<div class="modal-footer">
								<a class="btn btn-info" href="ServletPrestamos?anual=anual">
									Ver en Detalle </a> <a class="btn btn-secondary"
									href="ServletPrestamos?reporte=report"> Aceptar </a>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="ReporteTotal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Ingreso
									Total Prestamos</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								El Importe Total restante a cobrar de todos los prestamos es
								de:    $
								<%=df.format(total)%></div>
							<div class="modal-footer">
								<a class="btn btn-info" href="ServletPrestamos?total=total">
									Ver en Detalle </a> <a class="btn btn-secondary"
									href="ServletPrestamos?reporte=report"> Aceptar </a>

							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="ReporteFechas" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Prestamos
									entre fechas</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							   Generar reporte entre:
							<div class="modal-body">
								<form action="ServletPrestamos" method="get">

									<select name="mesa">
										<option value="0">--Seleccione Mes--</option>
										<option value="1">Enero</option>
										<option value="2">Febrero</option>
										<option value="3">Marzo</option>
										<option value="4">Abril</option>
										<option value="5">Mayo</option>
										<option value="6">Junio</option>
										<option value="7">Julio</option>
										<option value="8">Agosto</option>
										<option value="9">Septiembre</option>
										<option value="10">Octubre</option>
										<option value="11">Noviembre</option>
										<option value="12">Diciembre</option>

									</select> <label for="año1">del Año: </label> <select name="anio1">
										<option value="0">--Seleccione el Año--</option>
										<option value="2020">2020</option>
							
									</select>

									<div>hasta</div>

									<label for="mes2"></label> <select name="mes2">
										<option value="0">--Seleccione Mes--</option>
										<option value="1">Enero</option>
										<option value="2">Febrero</option>
										<option value="3">Marzo</option>
										<option value="4">Abril</option>
										<option value="5">Mayo</option>
										<option value="6">Junio</option>
										<option value="7">Julio</option>
										<option value="8">Agosto</option>
										<option value="9">Septiembre</option>
										<option value="10">Octubre</option>
										<option value="11">Noviembre</option>
										<option value="12">Diciembre</option>
									</select> <label for="anios2"> del Año</label> <select name="anio2">
										<option value="0">--Seleccione el Año--</option>
										<option value="2020">2020</option>
					

									</select>
							</div>
							<div class="modal-footer">



								<input type="submit" class="btn btn-info" value="Ver Reporte">
								<a class="btn btn-secondary"
									href="ServletPrestamos?reporte=report"> Cancelar </a>
							</div>
							</form>
						</div>
					</div>
				</div>

			</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid">
				<div class="float-right">
					<div class="text-center">Logueado como ${userconect.usuario}</div>
				</div>
			</div>
			</footer>

		</div>
	</div>


</body>

</html>