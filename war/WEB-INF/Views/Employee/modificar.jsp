<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.employee.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel='stylesheet' href="/CSS/bootstrap.min.css">
<link rel='stylesheet' href="/CSS/cargando.css">
<script type="text/javascript" src="/js/jQuery.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<style>
.titulo {
	/*color:inherit;*/
	color: inherit;
	margin-bottom: 20px;
}

.alert {
	padding: 10px;
}
body{

background-color:#E2F7E4;

}

#navegacion{
	background-color: skyblue;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<header> <nav class="navbar navbar-default ">
	<div class="navbar-header">
		<!-- Id navegacion  debe coincidir con el nombre id de abajo-->
		<button class="navbar-toggle" data-toggle="collapse"
			data-target="#navegacion">
			<!-- Mostrar en dispositivos de lectura que no reconocen los iconens-->
			<span class="sr-only">Mostrar Navegacion</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a href="/" class="navbar-brand">Inicio</a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li><a href="/employee/insertar">INSERTAR</a></li>
			<li><a href="/employee">REGISTRO DE DATOS</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">MODIFICAR</h3>
				
				<%
				Employee emp = (Employee)request.getAttribute("employee");
				%>
				<form id="form1" class="form-horizontal" action="/employee/modificar"
					method="POST">
					
					
					
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Apellido</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Apellido del empleado" name="apellido"
								required type="text" value=<%= emp.getApellido() %>>
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese nombre" name="nombre"
								required type="text" value=<%= emp.getNombre() %>>
						</div>
					</div>
					
				
					
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Profesion</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese la direccion del empleado" name="profesion"
								type="text" value=<%= emp.getProfesion() %>>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Telefono</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Telefono del empleado" name="telefono"
								type="text" value=<%= emp.getTelefono() %>>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Correo</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Correo" name="correo"
								required type="email" value=<%= emp.getCorreo() %>>
						</div>
					</div>
					
						
					<div class="text-right">
						<a href="/employee" class="btn btn-danger">CANCELAR</a>					
						<button class="btn btn-success" id="enviar" type="submit">MODIFICAR DATOS</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>