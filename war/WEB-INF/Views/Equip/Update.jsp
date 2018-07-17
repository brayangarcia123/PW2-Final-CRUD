<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.equip.*" %>
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
	<%
	Equip prof = (Equip)request.getAttribute("profesor");
				%>
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
			<li><a href="/equip/insert">INSERTAR</a></li>
			<li><a href="/equip">MOSTRAR EQUIPOS</a>
			<li class="active"><a href="/equip/update?id=<%=prof.getCodigo()%>">MODIFICAR</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-15 col-md-10">
				<!-- Crear Alumno -->
					 <h4><b>Modificando Ficha tecnica de Equipo</b></h4>
			
				<form id="form1" class="form-horizontal" action="/equip/update"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre del Equipo</label>
						<div class="col-sm-10">
						<input type="text" hidden name="codigo" value= <%= prof.getCodigo() %>>
							<input class="form-control"
								placeholder="Nombre del Equipo"  name="nombre"
								type="text" required="" value="<%= prof.getNombre() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Modelo del equipo</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Modelo del equipo" name="modelo"
								required type="text" value="<%= prof.getModelo() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Marca del equipo</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Marca del equipo" name="marca"
								type="text" value="<%= prof.getMarca() %>">
						</div>
					</div>
					
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Funcion y Usos del equipo</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Funcion y usos" name="funcion"
								type="text" value="<%= prof.getFuncion() %>">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label text-info">Descripcion fisica</label>
						<div class="col-sm-10">
							
								
								<input class="form-control"
									placeholder="Descripcion fisica" name="descripccion"
									type="text" value="<%= prof.getDescripccion() %>">
							
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Estado</label>
						<div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<% if (!prof.isEstado()) {%>
								<option <%="selected"%> value="false">INACTIVO</option>
								<% } else {%>
								<option value="false">INACTIVO</option>
								<% }%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<a href="/equip" class="btn btn-danger">CANCELAR</a>					
						<button class="btn btn-success" id="enviar" type="submit">MODIFICAR EQUIPO</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>