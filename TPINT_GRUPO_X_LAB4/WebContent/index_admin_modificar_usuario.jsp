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
</head>
<body class="sb-nav-fixed">
	<jsp:include page="MenuAdmin.html"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="sidebarAdmin.html"></jsp:include>
		<div id="layoutSidenav_content">
					<%
				int filas1 = -1;
				if (request.getAttribute("filasMU") != null) 
					filas1 = (Integer.parseInt(request.getAttribute("filasMU").toString()));
					if (filas1 == 1) {
			%>
			<div class="alert alert-danger" role="alert">
				Usuario inexistente.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<%
				} 
			%>
			<%
				int filas = -1;
				if (request.getAttribute("filasMCM") != null) 
					filas = (Integer.parseInt(request.getAttribute("filasMCM").toString()));
					if (filas == 1) {
			%>
			<div class="alert alert-success" role="alert">
				Usuario modificado.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<%
				} 
			%>
			<a href="index_admin.jsp" style="color: #fcb045;" class="nav-link">Volver
				a Inicio</a>
			<main>
			<div class="container-fluid">
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1 class="display-3">Modificar Cliente</h1>
					</div>
				</div>
				<form class="pb-5">
					<div class="form-group">
						<label for="nrocuenta">Ingrese el DNI :</label><input type="text"
							class="form-control" id="nrodni" name="nrodni"
							onkeypress="return ((event.charCode >= 48 && event.charCode <= 57 ))" required>
					</div>
					<button type="submit" name="modificar.buscar.cliente"
						class="btn w-50 d-block mx-auto btn-warning rounded-pill mt-5">Buscar
						DNI</button>
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