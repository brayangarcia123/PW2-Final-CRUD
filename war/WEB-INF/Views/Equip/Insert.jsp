<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href="/CSS/bootstrap.min.css">
<link rel='stylesheet' href="/CSS/cargando.css">

<style>
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
		<a href="/" class="navbar-brand">Inicio Equipos</a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">INSERTAR</a></li>
			<li><a href="/equip">MOSTRAR EQUIPOS</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-15 col-md-10">
				<!-- Crear Alumno -->
					 <h4><b>Insertar ficha tecnica de Equipos</b></h4>
				<form id="form1" class="form-horizontal" action="/equip/insert"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre del equipo</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Nombre del equipo" autofocus name="nombre"
								type="text" required="">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Modelo del equipo</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Modelo del equipo" name="modelo"
								required type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Marca del equipo</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese la marca del equipo" name="marca"
								type="text" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Funcion y usos</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese funciones y usos del equipo" name="funcion"
								required="" type="text">
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label text-info">Descripcion fisica</label>
						<div class="col-sm-10">
							
								<input class="form-control"
									placeholder="Ingrese descripcion fisica" name="descripccion"
									type="text" required >
			
						</div>
					</div>
					
					<div class="text-right">
						<button class="btn btn-success" id="enviar" type="submit">Insertar Equipo</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>