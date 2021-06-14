<%@page import="Entidades.Cuenta"%>
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
						$('#tabla_cuenta')
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
<script>
function validarCampos() {
	var saldo = document.getElementById("saldo").value;
	var error = document.getElementById("lblerror");
	if(saldo == ""){
		error.style.display="block";
		return false;
	}
	return true;
}
</script>
</head>

<body class="sb-nav-fixed">
	<jsp:include page="MenuAdmin.html"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="sidebarAdmin.html"></jsp:include>
		<div id="layoutSidenav_content">
		<a href="index_admin.jsp" style="color: #fcb045;" class="nav-link">Volver a Inicio</a>
			<main>
			<div class="container-fluid">
				<div class="jumbotron jumbotron-fluid mb-5">
					<div class="container">
						<h1 class="display-3">Actualizar Cuenta</h1>
					</div>
				</div>
				<%
					Cuenta cuenta = null;
					if (request.getAttribute("cuenta") != null) {
						cuenta = (Cuenta) request.getAttribute("cuenta");
					}
				%>

				<table id="tabla_cuenta">

					<thead>
						<tr>
							<th scope="col">Número de cuenta</th>
							<th scope="col">DNI</th>
							<th scope="col">CBU</th>
							<th scope="col">Tipo</th>
							<th scope="col">Saldo</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (cuenta != null) {
						%>
						<tr>

							<td><%=cuenta.getNro_Cuenta()%></td>
							<td><%=cuenta.getDni()%></td>
							<td><%=cuenta.getCBU_Cuenta()%></td>
							<td><%=cuenta.getTipo_Cuenta()%></td>
							<td><%=cuenta.getSaldo_Cuenta()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<div class="container-fluid mt-5">
				<form class="needs-validation" id="id_form">
					<div class="form-group">
						<label for="nrocuenta">Ingrese el nuevo saldo:</label> <input
							type="text" class="form-control" id="saldo" name="saldo"
							onkeypress="return ((event.charCode >= 46 && event.charCode <= 57 ))">

						<input type="hidden" name="numero"
							value="<%=cuenta.getNro_Cuenta()%>">

					</div>
					<!-- Tipo de cuenta: <br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" value=1 id="radio1"
							name="grupo1"> <label class="form-check-label"
							for="radio1"> Caja de ahorro </label>
					</div>
					
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" value=2 id="radio2"
							name="grupo1"> <label class="form-check-label"
							for="radio2"> Cuenta corriente </label>
					</div>
					-->
					<label id="lblerror" style="color:red;display:none;">Campo Saldo incompleto.</label>
					<button type="submit" name="modificar.guardar_cambios"
						class="btn w-50 d-block mx-auto btn-warning rounded-pill mt-5" onClick="return validarCampos();">Actualizar
						cuenta</button>

				</form>
			</div>
			</main>
			<footer class="py-4 bg-light mt-5">
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