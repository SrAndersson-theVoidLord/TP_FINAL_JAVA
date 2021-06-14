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
<script>
	function validarCampos() {
		var dni = document.getElementById("nombreUsuario").value;
		var error = document.getElementById("lblerror");
		if (dni == "") {
			error.style.display = "block";
			return false;
		}
		if (!document.querySelector('input[name="grupo1"]:checked')) {
			error.style.display = "block";
			return false;
		}
		error.style.display = "none";
		return true;
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
				if (request.getAttribute("filasC") != null) {
					filas = (Integer.parseInt(request.getAttribute("filasC").toString()));
					if (filas == 1) {
			%>
			<div class="alert alert-success" role="alert">
				Cuenta agregada.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<%
				} else {
			%>
			<div class="alert alert-danger" role="alert">
				No se pudo agregar la cuenta.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				}
				}
			%>
			<a href="index_admin.jsp" style="color: #fcb045;" class="nav-link">Volver
				a Inicio</a>
			<main>
			<div class="container-fluid">
				<div class="jumbotron">
					<div class="container">
						<h1 class="display-3">Asignar Cuenta</h1>
					</div>
				</div>
				<form>

					<%
						Integer numero = 0;
						Integer cbu = 0;
						if (request.getAttribute("id") != null) {
							numero = (Integer) request.getAttribute("id");
							cbu = numero;
							numero += 563675;
							cbu += 909852;

						}
					%>
					<div class="form-group">
						<label for="nombre">Ingrese el DNI de usuario:</label> <input
							type="text" class="form-control" id="nombreUsuario"
							name="nombreUsuario"
							onkeypress="return ((event.charCode >= 48 && event.charCode <= 57))">
					</div>


					Tipo de cuenta: <br>
					<div class="form-check form-check-inline my-3">
						<input class="form-check-input" type="radio" value=1 id="radio1"
							name="grupo1"> <label class="form-check-label"
							for="radio1"> Caja de ahorro </label>
					</div>
					<div class="form-check form-check-inline my-3">
						<input class="form-check-input" type="radio" value=2 id="radio2"
							name="grupo1"> <label class="form-check-label"
							for="radio2"> Cuenta corriente </label>
					</div>
					<br>

					<div class="form-group">
						<label for="nrocuenta"> Número de cuenta: <%=numero%>
						</label> <input type="hidden" name="nrocuenta" value="<%=numero%>">

					</div>
					<div class="form-group">
						<label for="CBU"> Número de CBU <%=cbu%></label> <input
							type="hidden" name="CBU" value="<%=cbu%>">
					</div>
					<label id="lblerror" style="color: red; display: none;">Campos
						incompletos.</label>
					<button type="submit" name="btnasignar"
						class="btn w-50 btn-warning d-block mx-auto rounded-pill mt-5"
						onClick="return validarCampos();">Asignar cuenta</button>
				</form>
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