<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<a href="/index.html" class="navbar-brand">Inicio</a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">INSERTAR</a></li>
			<li><a href="/avance">REGISTRO DE DATOS</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">INSERTAR PROYECTO</h3>
				<form id="form1" class="form-horizontal" action="/avance/insertar"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Nombre del Encargado" name="nombre"
								required type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Apellido</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Apellido del Encargado" name="apellido"
								required type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Profesion</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese la profesion de encargado" name="profesion"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Telefono</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Telefono del encargado" name="telefono"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Proyecto</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Nombre del Proyecto" autofocus name="proyecto"
								type="text" required="">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Avance del Proyecto</label>
						<div class="col-sm-3">
							<select class="form-control"
								name="avance" >	
								<option>0</option>						
								<option>10</option>
								<option>20</option>
								<option>30</option>
								<option>40</option>
								<option>50</option>
								<option>60</option>
								<option>70</option>
								<option>80</option>
								<option>90</option>
								<option>100</option>
							</select>	
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-success" id="enviar" type="submit">Enviar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>