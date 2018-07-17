<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.equip.Equip" %>
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
			<li><a href="/equip/insert">INSERTAR</a></li>
			<li class="active"><a href="">MOSTRAR EQUIPOS</a>
		</ul>
	</div>
	</nav> </header>

	<!--TABLA -->
	<div class="container-fluid">
	 <h4><b>Ficha tecnica de Equipos</b></h4>
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Nombre</th>
					<th>Modelo</th>
					<th>Marca</th>
					<th>Funcion y usos</th>
					<th>Descripcion fisica</th>
					<th>Estado</th>

				</tr>
				<% 
					List<Equip> array = (List<Equip>)request.getAttribute("array");
				
					if(array.size() > 0) {	
						for(Equip prof:array){
				%>
				<tr>
					<td><%= prof.getNombre() %></td>
					<td><%= prof.getModelo() %></td>
					<td><%= prof.getMarca() %></td>
					<td><%= prof.getFuncion() %></td>
					<td><%= prof.getDescripccion() %></td>
					<td><%= prof.getEstadoDescripcion()%></td>

					<td class='btn btn-group'>
						<a href="/equip/update?codigo=<%= prof.getCodigo() %>" class="btn btn-primary btn-sm">Modificar</a> 
						<a href="/equip/delete?codigo=<%= prof.getCodigo() %>" class="btn btn-danger btn-sm">Eliminar</a>
					</td>
				</tr>
				<% }
				} %>
				
			</table>
			<div>
			<a href="/equip" class="btn btn-success">ACTUALIZAR EQUIPOS</a>
			<br>
			</div>
			
		</div>

	</div>
</body>
</html>