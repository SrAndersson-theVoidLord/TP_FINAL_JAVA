<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Saldo insuficiente</title>
	<meta charset="utf-8">
	<link rel="stylesheet" media="screen" href="css/estilos_clientes.css">
</head>
<body>

<div class="userpass-error">
    <div class="circulo-img">
      <img src="img/sinsaldo.png">
    </div>  
    <h1>¡ups la transferencia no puede ser procesada!</h2>
    <h2 style="color:red">¡Cuenta de origen y de destino son iguales!</h2>
    <br>
  <div class="opcion-envio">
  <a class="btn-envio-cp" href="ServletCuenta?cuenta=1">Volver</a>
  </div>   
  </div>

</body>
</html>