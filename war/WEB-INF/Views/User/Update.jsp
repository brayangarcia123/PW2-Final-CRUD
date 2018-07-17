<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.userss.*"%>
<%@ page import="model.role.*"%>
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
	<%
		Userss usuario = (Userss) request.getAttribute("usuario");
		List<Role> array = (List<Role>) request.getAttribute("array");
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
		<a href="/" class="navbar-brand">Inicio </a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li><a href="/user/insert">INSERTAR</a></li>
			<li><a href="/user">MOSTRAR USUARIOS</a>
			<li class="active"><a
				href="/user/update?id=<%=usuario.getCodigo()%>">MODIFICAR</a>
		</ul>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-md-6">
				<!-- Crear Alumno -->
				<h4>
					<b>Modificando Usuario</b>
				</h4>

				<form id="form1" class="form-horizontal" action="/user/update"
					method="POST">
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Nombre del usuario</label>
						<div class="col-sm-10">
							<input type="text" hidden name="codigo"
								value=<%=usuario.getCodigo()%>> <input
								class="form-control" placeholder="Nombre del Usuario"
								name="nombre" type="text" required=""
								value="<%=usuario.getNombre()%>">
						</div>
					</div>
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Apellido del usuario</label>
						<div class="col-sm-10">
							<input class="form-control" placeholder="Apellido del Usuario"
								name="apellido" required type="text"
								value="<%=usuario.getApellido()%>">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label text-danger">Email del usuario</label>
						<div class="col-sm-10">
							<div class="input-group ">
								<div class="input-group-addon">@</div>
								<input class="form-control" placeholder="Gmail Usuario"
									name="email" type="email" value="<%=usuario.getEmail()%>">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Rol del usuario</label>
						<div class="col-sm-10">
							<%
								if (array != null && array.size() > 0) {
							%>
							<select class="form-control" name="idRol">
								<%
									for (Role role : array) {
											if (role.getId().equals(usuario.getCodigo())) {
								%>

								<option value="<%=role.getId()%>" selected><%=role.getNombre()%></option>
								<%
									} else {
								%>
								<option value="<%=role.getId()%>"><%=role.getNombre()%></option>
								<%
									}
										}
								%>
							</select>
							<%
								}
							%>
						</div>
					</div>

					<div class="form-group">
						<label class="text-danger col-sm-2 control-label">Estado</label>
						<div class="col-sm-6">
							<select class="form-control" name="estado">
								<option value="true">ACTIVO</option>
								<%
									if (!usuario.isEstado()) {
								%>
								<option <%="selected"%> value="false">INACTIVO</option>
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
						<a href="/user" class="btn btn-danger">CANCELAR MODIFICACION</a>
						<button class="btn btn-success" id="enviar" type="submit">MODIFICAR
							USUARIO</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
</body>
</html>