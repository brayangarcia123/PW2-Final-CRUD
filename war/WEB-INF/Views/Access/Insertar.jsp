<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.role.Role"%>
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
		<a href="/" class="navbar-brand">Inicio</a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">INSERTAR ACCESO</a></li>
			<li><a href="/access">MOSTRAR ACCESOS</a>
		</ul>
	</div>
	</nav> </header>
	<%
		List<Role> arrayRole = (List<Role>) request.getAttribute("arrayRole");
		List<Resource> arrayRecurso = (List<Resource>) request.getAttribute("arrayRecurso");
	%>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">INSERTAR RECURSO</h3>
				<form id="form1" class="form-horizontal" action="/access/insert"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-3 control-label">Role</label>
						<div class="col-sm-9">
							<select class="form-control" name="role">
								<% if(arrayRole.size() > 0){ 
									for(Role rol : arrayRole){
									%>
								<option value=<%=rol.getId() %>><%=rol.getNombre() %></option>

								<%} 
									}%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-3 control-label">Recurso</label>
						<div class="col-sm-9">
							<select class="form-control" name="recurso">
								<% if(arrayRecurso.size() > 0){ 
									for(Resource recurso : arrayRecurso){
									%>
								<option value=<%=recurso.getId() %>><%=recurso.getUrl() %></option>
								<%} 
									}%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-success" id="enviar" type="submit">Insertar Acceso</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>