<%@page import="javax.swing.JOptionPane"%>
<%@page import="Entidades.Cuenta"%>
<%@page import="java.util.ArrayList"%>

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
						$('#tabla_users')
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
				<div class="jumbotron">
					<div class="container">
						<h1 class="display-3">Listado Cuentas</h1>
					</div>
				</div>
				<%
					if (request.getAttribute("log") != null) {

						JOptionPane.showMessageDialog(null, "Cuenta Eliminada Correctamente");
					}
				%>
				<%
					ArrayList<Cuenta> lista = null;
					if (request.getAttribute("listaC") != null) {
						lista = (ArrayList<Cuenta>) request.getAttribute("listaC");
					}
				%>
				<table id="tabla_users">
					<thead>
						<tr>
							<th scope="col">Nro Cuenta</th>
							<th scope="col">Dni</th>
							<th scope="col">Saldo</th>
							<th scope="col">Tipo</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<%
							if (lista != null)
								for (Cuenta cuenta : lista) {
						%>
						<tr>
							<td><%=cuenta.getNro_Cuenta()%></td>
							<td><%=cuenta.getDni()%></td>
							<td><%=cuenta.getSaldo_Cuenta()%></td>
							<td><%=cuenta.getTipo_Cuenta()%></td>
							<td>
								<%
									int nrocuenta = cuenta.getNro_Cuenta();

											Cuenta cuentta = cuenta;

											String cuentac = "A" + cuenta.getNro_Cuenta();

											String cuentaconcat = "#A" + cuenta.getNro_Cuenta();
								%> <a><button type="button" class="btn btn-danger"
										data-toggle="modal" data-target="<%=cuentaconcat%>">
										Eliminar</button></a>

							</td>
						</tr>
						<div class="modal fade" id="<%=cuentac%>" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Eliminar
											Cuenta</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										Desea eliminar a la cuenta Nro:<%=cuenta.getNro_Cuenta()%>
									</div>
									<div class="modal-footer">


										<a class="btn btn-danger"
											href="ServletCuentas?cuentaeliminar=<%=cuenta.getNro_Cuenta()%>">
											Confirmar </a>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Cancelar</button>


									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</tbody>
				</table>

			</div>
			</main>
			<!-- ./container -->
			<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid">
				<div class="float-right">
					<div class="text-muted">Logueado como ${userconect.usuario}</div>
				</div>
			</div>
			</footer>
		</div>

	</div>

</body>
</html>