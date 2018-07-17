<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.localll.Localll" %>
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
<script>
            $(document).ready(function(){
                $('.btn-danger').click(function(){
                    var a = confirm("Estas Seguro de Eliminar");
                    if(!a){
                        return false;
                    }
                });
                
            });
            
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
		<a href="/index.html" class="navbar-brand">Inicio</a>
	</div>
	<div class="collapse navbar-collapse" id="navegacion">
		<!-- Fijar el atributo role-->
		<ul class="nav navbar-nav">
			<li><a href="/localll/insertar">INSERTAR</a></li>
			<li class="active"><a href="">REGISTRO DE DATOS</a>
		</ul>
	</div>
	</nav> </header>

	<br>
	<!--TABLA -->
	<div class="container-fluid">
		<div class="table-responsive  ">
			<table class="table table-hover table-condensed">
				<tr>
					<th>Codigo</th>
					<th>Local</th>
					
					<th>Encargado</th>
					<th>Telefono</th>
					<Th>Direccion</th>
					

				</tr>
				<% 
					List<Localll> array = (List<Localll>)request.getAttribute("array");
				
					if(array.size() > 0) {
						
						for(Localll prof:array){
				%>
				<tr>
					<td><%= prof.getCodigo() %></td>
					
					<td><%= prof.getLocal() %></td>
					
					<td><%= prof.getEncargado() %></td>
					<td><%= prof.getTelefono() %></td>
					<td><%= prof.getDireccion() %></td>
					
					

					<td class='btn btn-group'>
						<a href="/localll/modificar?codigo=<%= prof.getCodigo() %>" class="btn btn-primary btn-sm">Modificar</a> 
						<a href="localll/eliminar?codigo=<%= prof.getCodigo() %>" class="btn btn-danger btn-sm">Eliminar</a>
					</td>
				</tr>
				<% }
				} %>
				
			</table>
			<div class="text-center">
			<a href="/localll" class="btn btn-success">ACTUALIZAR</a>
			<br>
			</div>
			
		</div>

	</div>
</body>
</html>