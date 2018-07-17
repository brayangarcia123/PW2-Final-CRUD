<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.resource.Resource"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href="/CSS/bootstrap.min.css">
<link rel='stylesheet' href="/CSS/cargando.css">

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
		<a href="/" class="navbar-brand">Inicio </a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li><a href="/resource/insert">INSERTAR RECURSO</a></li>
			<li class="active"><a href="">MOSTRAR RECURSOS</a>
		</ul>
	</div>
	</nav> </header>

	<br>
	<!--TABLA -->
	<div class="container">
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Codigo del Recurso</th>
					<th>Recurso URL</th>
					<th>Creacion</th>
					<th>Estado del Recurso</th>
					<th></th>
				</tr>
				<% 
					List<Resource> array = (List<Resource>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(Resource rec:array){
				%>
				<tr>
					<td><%= rec.getId() %></td>
					<td><%= rec.getUrl() %></td>
					<td><%= rec.fechaDescripcion() %></td>
					<td><%= rec.estadoDescripcion() %></td>


					<td class='btn btn-group'><a
						href="/resource/update?id=<%= rec.getId() %>"
						class="btn btn-primary btn-sm">Modificar</a></td>
				</tr>
				<% }
				} %>

			</table>
			<div>
				<a href="/resource" class="btn btn-success">ACTUALIZAR RECURSOS</a> <br>
			</div>

		</div>

	</div>
</body>
</html>