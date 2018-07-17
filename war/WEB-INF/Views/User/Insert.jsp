<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="model.role.Role"%>
<%@ page import="java.util.List"%>
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
		
		<button class="navbar-toggle" data-toggle="collapse"
			data-target="#navegacion">
			
			<span class="sr-only">Mostrar Navegacion</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a href="/" class="navbar-brand">Inicio </a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">INSERTAR</a></li>
			<li><a href="/user">MOSTRAR USUARIOS</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
					 <h4><b>Insertar Usuario</b></h4>
				<form id="form1" class="form-horizontal" action="/user/insert"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre del usuario</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Nombre del usuario" autofocus name="nombre"
								type="text" required="">
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Apellido del usuario</label>
						<div class="col-sm-10">
							<input class="form-control"
								placeholder="Ingrese Apellido del usuario" name="apellido"
								required type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label text-info">Email del usuario</label>
						<div class="col-sm-10">
							<div class="input-group ">
								<div class="input-group-addon">@</div>
								<input class="form-control"
									placeholder="Ingrese gmail del usuario" name="email"
									type="email" required>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Rol del usuario</label>
						<div class="col-sm-10">
							<%
							List<Role> array = (List<Role>)request.getAttribute("array");
							if(array != null && array.size() > 0){
							%>
							<select class="form-control" name="idRol">
								<% for(Role rol : array) {%>
								<option value= <%=rol.getId() %>><%=rol.getNombre()%></option>
								<%} %>
							</select>
							<% }%>
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-success" id="enviar" type="submit">Insertar
							Usuario</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</html>