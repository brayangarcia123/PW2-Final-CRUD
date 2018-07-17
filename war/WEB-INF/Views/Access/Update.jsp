<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.access.*"%>
<%@ page import="model.resource.*"%>
<%@ page import="model.role.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href="/CSS/bootstrap.min.css">
<link rel='stylesheet' href="/CSS/cargando.css">
<script type="text/javascript" src="/js/jQuery.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>

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
			<li><a href="/access/insert">INSERTAR ACCESO</a></li>
			<li><a href="/access">MOSTRAR ACCESOS</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">MODIFICAR ACCESOS</h3>

				<%
					Access acceso = (Access) request.getAttribute("acceso");

					List<Role> arrayRole = (List<Role>) request.getAttribute("arrayRole");
					List<Resource> arrayRecurso = (List<Resource>) request.getAttribute("arrayRecurso");
				%>
				<form id="form1" class="form-horizontal" action="/access/update"
					method="POST">
					<div class="form-group">
						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Role</label>
							<div class="col-sm-9">
								<input type="text" hidden name="id" value=<%=acceso.getId()%>>
								<select class="form-control" name="role">
									<%
										if (arrayRole.size() > 0) {
											for (Role rol : arrayRole) {
									 		if(rol.getId().equals(acceso.getIdRole())){
									%>
									<option value=<%=rol.getId()%> selected><%=rol.getNombre()%></option>
									<%} else { %>
									<option value=<%=rol.getId()%>><%=rol.getNombre()%></option>

									<%
										}
									}
									}
									%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Recurso</label>
							<div class="col-sm-9">
								<select class="form-control" name="recurso">
									<%
										if (arrayRecurso.size() > 0) {
											for (Resource recurso : arrayRecurso) {
												 if(recurso.getId().equals(acceso.getIdRecurso())){
									%>
									<option value=<%=recurso.getId()%> selected><%=recurso.getUrl()%></option>

											<% } else {%>
									<option value=<%=recurso.getId() +" "+ acceso.getIdRecurso() %>><%=recurso.getUrl()%></option>

									<%
												}
									 	}
									}
									%>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label class="text-info col-sm-3 control-label">Estado</label>
							<div class="col-sm-6">
								<select class="form-control" name="estado">
									<option value="true">ACTIVO</option>
									<%
										if (!acceso.isEstado()) {
									%>
									<option <%="selected"%>>INACTIVO</option>
									<%
										} else {
									%>
									<option value="false">INACTIVO</option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="text-right">
							<a href="/access" class="btn btn-danger">CANCELAR MODIFICACION</a>
							<button class="btn btn-success" id="enviar" type="submit">MODIFICAR
								ACCESO</button>

						</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>