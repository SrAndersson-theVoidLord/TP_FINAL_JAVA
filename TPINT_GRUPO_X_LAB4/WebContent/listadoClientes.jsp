<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.PrintStream"%>
<%@page import="Entidades.Usuario"%>
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
	<div id="layoutSidenav" class="mb-3">
		<jsp:include page="sidebarAdmin.html"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
			<a href="index_admin.jsp" style="color: #fcb045;" class="nav-link">Volver a Inicio</a>
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1 class="display-3">Listado de Clientes</h1>
					</div>
				</div>
				<%
					if (request.getAttribute("log") != null) {

						JOptionPane.showMessageDialog(null, "Usuario Eliminado Correctamente");
					}
				%>

				<%
					ArrayList<Usuario> lista = null;
					if (request.getAttribute("listaU") != null) {
						lista = (ArrayList<Usuario>) request.getAttribute("listaU");

					}
				%>
				<table id="tabla_users" class="pb-5">
					<thead>
						<tr>
							<th scope="col">DNI</th>
							<th scope="col">CUIL</th>
							<th scope="col">Nombre</th>
							<th scope="col">Apellido</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<%
							if (lista != null)
								for (Usuario user : lista) {
						%>
						<tr>
							<td><%=user.getDni()%></td>
							<td><%=user.getCuil()%></td>
							<td><%=user.getNombre()%></td>
							<td><%=user.getApellido()%></td>

							<td>
								<%
									String dni = user.getDni();
								%> <%
 	Usuario usert = user;
 %> <%
 	String dnic = "A" + user.getDni();
 %> <%
 	String dniconcat = "#A" + user.getDni();
 %> <a><button type="button" class="btn btn-danger"
										data-toggle="modal" data-target="<%=dniconcat%>">
										Eliminar</button></a>

							</td>
						</tr>
						<div class="modal fade" id="<%=dnic%>" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Eliminar
											Usuario</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										Desea eliminar a
										<%=usert.getNombre()%>
										<%=usert.getApellido()%>

									</div>
									<div class="modal-footer">


										<a class="btn btn-danger"
											href="ServletUsuario?Dni=<%=usert.getDni()%>"> Confirmar
										</a>
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
			</main>
			<footer class="py-4 bg-light mt-5">
			<div class="container-fluid">
				<div class="float-right">
					<div class="text-muted">Logueado como ${userconect.usuario}</div>
				</div>
			</div>
			</footer>
		</div>
		<!-- ./container -->

	</div>
</body>
</html>