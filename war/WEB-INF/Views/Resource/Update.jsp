<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.resource.*"%>
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
		<a href="/" class="navbar-brand">Inicio </a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li><a href="/resource/insert">INSERTAR RECURSO</a></li>
			<li><a href="/resource">MOSTRAR RECURSOS</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h3 class="titulo text-center">MODIFICAR RECURSO</h3>

				<%
				Resource rec = (Resource)request.getAttribute("recurso");
				%>
				<form id="form1" class="form-horizontal" action="/resource/update"
					method="POST">
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Nombre del rescurso</label>
						<div class="col-sm-10">
							<input type="text" hidden name="id" value=<%= rec.getId() %>>
							<input class="form-control" placeholder="Ingrese URL del Recurso"
								name="url" type="text" required=""
								value=<%= rec.getUrl() %>>
						</div>
					</div>
					<div class="form-group">
						<label class="text-info col-sm-2 control-label">Estado del recurso</label>
						<div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<% if (!rec.isEstado()) {%>
								<option <%="selected"%>>INACTIVO</option>
								<% } else {%>
								<option value="false">INACTIVO</option>
								<% }%>
							</select>
						</div>
					</div>
					<div class="text-right">
						<a href="/resource" class="btn btn-danger">CANCELAR MODIFICACION</a>
						<button class="btn btn-success" id="enviar" type="submit">MODIFICAR
							RECURSO</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>