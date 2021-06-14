<%@page import="Entidades.Localidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Provincia"%>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/all.min.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script>
	function validarCampos() {
		var pvc = document.getElementById("provincia").value;
		var loc = document.getElementById("localidad").value;
		var error = document.getElementById("lblerror");
		var contra = document.getElementById("contra");
		var contra1 = document.getElementById("contra1");
		if (contra.value != contra1.value) {
			error.style.display="block";
			return false;
		}
		if(pvc == 0){
			error.style.display="block";
			return false;
		}
		if(loc == 0){
			error.style.display="block";
			return false;
		}
		return true;
	}

	function cargarLoc(idprov) {
		for (var i = 0, max = document.getElementById("localidad").options.length; i < max; i++) {
			document.getElementById("localidad").options[i].style.display = "none";
		}
		var opciones = document.getElementsByClassName("_" + idprov);
		for (var i = 0, max = opciones.length; i < max; i++) {
			opciones[i].style.display = "block";
		}
	}
</script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="MenuAdmin.html"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="sidebarAdmin.html"></jsp:include>
		<div id="layoutSidenav_content">
		<%
				int filas = -1;
				if (request.getAttribute("filas") != null)
					filas = (Integer.parseInt(request.getAttribute("filas").toString()));
				if (filas == 1) {
			%>
			<div class="alert alert-success" role="alert">
				Usuario Agregado.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<%
				} else if(filas == 0){
			%>
			<div class="alert alert-danger" role="alert">
				No se pudo agregar el usuario.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				}
			%>
		<a href="index_admin.jsp" style="color: #fcb045;" class="nav-link">Volver a Inicio</a>
			<div class="container-fluid">
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1 class="display-3">Agregar Cliente</h1>
					</div>
				</div>
				<div class="jumbotron">
					<h2 class="mb-5 mt-1">Completar el siguiente formulario</h2>
					<div class="registro-box">
						<form class="mt-2 rounded" id="form" action="ServletUsuario"
							method="get">
							<!-- Primer fila nombre , apellido , usuario -->
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<label for="validationServer01">Nombre</label> <input
										type="text" class="form-control" id="nombre"
										placeholder="Nombre" name="nombreUser" pattern="([A-Za-z])\w+"
										maxlength="30" required>

								</div>
								<div class="col-md-4 mb-3">
									<label for="validationServer02">Apellido</label> <input
										type="text" class="form-control" id="apellido"
										placeholder="Apellido" name="apellidoUser"
										pattern="([A-Za-z])\w+" maxlength="30" required>

								</div>
								<div class="col-md-4 mb-3">
									<label for="validationServerUsername">Usuario</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend3"><i
												class="fas fa-user"></i></span>
										</div>
										<input type="text" maxlength="20" pattern="([A-Za-z0-9])\w+"
											class="form-control" id="usuario" name="usuarioUser"
											placeholder="Usuario" aria-describedby="inputGroupPrepend3"
											required>

									</div>
								</div>
							</div>

							<!-- Segunda fila direccion, localidad , provincia-->
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<label for="validationServer01">Dirección</label> <input
										type="text" class="form-control" id="direccion"
										pattern="^[A-Za-z0-9\s]+$" name="direccionUser"
										placeholder="Dirección" required>

								</div>
								<%
									ArrayList<Provincia> ListaProv = null;
									ArrayList<Localidad> listaLoc = null;
									if ((ArrayList<Provincia>) request.getAttribute("listaP") != null) {
										ListaProv = (ArrayList<Provincia>) request.getAttribute("listaP");
									}
									if ((ArrayList<Localidad>) request.getAttribute("listaL") != null) {
										listaLoc = (ArrayList<Localidad>) request.getAttribute("listaL");
									}
								%>
								<div class="col-md-4 mb-3">
									<label for="provincia" class="col-12">Provincia</label> <select
										name="provincia" class="form-control" id="provincia"
										onchange="cargarLoc(this.value);">
										<option value="0">--Seleccione Provincia--</option>
										<%
											if (ListaProv != null)
												for (Provincia prov : ListaProv) {
										%>
										<option value="<%=prov.getId_provincia()%>"><%=prov.getDesc_provincia()%></option>
										<%
											}
										%>
									</select>
								</div>
								<%
									ArrayList<Localidad> ListaLoc = null;
									if ((ArrayList<Localidad>) request.getAttribute("listaL") != null) {
										ListaLoc = (ArrayList<Localidad>) request.getAttribute("listaL");
									}
								%>
								<div class="col-md-4 mb-3">
									<label for="localidad">Localidad</label> <select
										class="form-control" name="localidad" id="localidad">
										<option value="0">--Seleccione Localidad--</option>
										<%
											if (ListaLoc != null)
												for (Localidad loc : ListaLoc) {
										%>
										<option class="_<%=loc.getId_pvc()%> optLoc"
											value="<%=loc.getId_localidad()%>"><%=loc.getDesc_localidad()%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<!-- Tercer fila DNI, CUIL , NACIONALIDAD -->
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<label for="validationServer01">DNI</label> <input
										type="number" class="form-control" id="dni" placeholder="DNI"
										name="dniUser" minlength="1" maxlength="9" pattern="\d[0-9]"
										required>

								</div>
								<div class="col-md-4 mb-3">
									<label for="validationServer02">Cuil</label> <input
										type="number" class="form-control" pattern="\d[0-9]" id="cuil"
										placeholder="Cuil" name="cuilUser" required>

								</div>
								<div class="col-md-4 mb-3">
									<label for="validationServer02">Nacionalidad</label> <input
										type="text" class="form-control" id="nacionalidad"
										name="nacionalidadUser" placeholder="Nacionalidad"
										pattern="([A-Za-z])\w+" required>

								</div>
							</div>

							<!-- Cuarta fila Telefono, celular  -->
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<label for="validationServer01">Teléfono</label> <input
										type="number" class="form-control" id="telefono"
										placeholder="Teléfono" pattern="\d[0-9]" name="telefonoUser"
										required>

								</div>
							</div>


							<!-- quinta fila Fecha de nacimiento, sexo -->
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<label for="validationServer02">Fecha de nacimiento</label> <input
										type="text" class="form-control" id="fechaNacimiento"
										name="fechanacUser"
										pattern="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"
										placeholder="Fecha Nacimiento" id="birthDate" required>

								</div>
								<div class="col-md-4 mb-3">
									<label for="validationServer02">Sexo</label> <select
										class="form-control" name="sexoUser" id="sexo">
										<option value="femenino">Femenino</option>
										<option value="masculino">Masculino</option>
									</select>
								</div>
							</div>
							<!-- sexta fila mail y contraseñas -->
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<label for="validationServer01">Correo</label> <input
										type="email"
										class="form-control" id="correo" name="emailUser"
										placeholder="Email" required>

								</div>
								<div class="col-md-4 mb-3">
									<label for="validationServer02">Contraseña</label> <input
										type="password" class="form-control" id="contra"
										name="contraseniaUser" placeholder="Contraseña" required>

								</div>
								<div class="col-md-4 mb-3">
									<label for="validationServer02">Confirmar la contraseña</label>
									<input type="password" class="form-control" id="contra1"
										name="contra1User" placeholder="Contraseña" required>

								</div>
							</div>
							<label id="lblerror" style="color:red;display:none;">Campos erróneos.</label>
							<!-- BOTON REGISTRO -->
							<div class="d-flex justify-content-center">
								<input type="submit" name="btnRegistrar"
									onClick="return validarCampos();"
									class="btn w-50 btn-warning rounded-pill mt-5"
									value="Crear Cliente">
							</div>

						</form>

					</div>
				</div>
				<!-- ./container -->
			</div>

			</main>
			<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid">
				<div class="float-right">
					<div class="text-muted">Logueado como ${userconect.usuario}</div>
				</div>
			</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/all.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>