<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.userss.Userss"%>
<%@page import="model.role.Role"%>
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
		<a href="/" class="navbar-brand">Inicio </a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li><a href="/user/insert">INSERTAR</a></li>
			<li class="active"><a href="">MOSTRAR USUARIOS</a>
		</ul>
	</div>
	</nav> </header>

	<!--TABLA -->
	<div class="container-fluid">
		<h4>
			<b>Datos de Usuarios</b>
		</h4>
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Nombre del usuario</th>
					<th>Apellido del usuario</th>
					<th>Email del usuario</th>
					<th>Rol del usuario</th>
					<th>Estado</th>
				</tr>
				<% 
					List<Userss> array = (List<Userss>)request.getAttribute("array");
					List<Role> arrayRole = (List<Role>)request.getAttribute("arrayRol");
 					if(array.size() > 0) {	
 						int i = 0;
 						Role rol;
						for(Userss usuario:array){
						 rol = arrayRole.get(i);
				%>
				<tr>
					<td><%= usuario.getNombre() %></td>
					<td><%= usuario.getApellido() %></td>
					<td><%= usuario.getEmail() %></td>
					<td><%= rol.getNombre() %></td>
					<td><%= usuario.getEstadoDescripcion()%></td>

					<td class='btn btn-group'><a
						href="/user/update?codigo=<%= usuario.getCodigo() %>"
						class="btn btn-primary btn-sm">Modificar</a></td>
				</tr>
				<% i++;}
				} %>

			</table>
			<div>
				<a href="/user" class="btn btn-success">ACTUALIZAR USUARIOS</a> <br>
			</div>

		</div>

	</div>
</body>
</html>