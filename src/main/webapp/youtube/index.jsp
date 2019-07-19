<%@page import="com.ipartek.formacion.controller.YoutubeController"%>

<%@page import="com.ipartek.formacion.model.dao.VideoDAO"%>
<%@page import="com.ipartek.formacion.model.pojo.Video" %>
<%@page import="java.util.ArrayList" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Listado de Videos</h1>
	<form class="form-inline mb-2" action="crearVideo" method="get">
		<label class="sr-only" for="buscar">Video a buscar</label>
		<input class="form-control col-md-4" type="search" name="buscar" id="buscar" value="${buscar}" placehorder="Dime tu nombre" required>
		<button class="btn btn-primary ml-2" type="submit"><i class="fas fa-search"></i></button>
		<a href="crearVideo?op=<%=YoutubeController.OP_CREARNUEVO%>" class="btn btn-primary ml-2 mb-1">+ Nuevo Video</a>
	</form>
	
	<table class="table">
  		<thead>
    		<tr>
      			<th scope="col">ID</th>
      			<th scope="col">Titulo</th>
      			<th scope="col">Codigo</th>
      			<th scope="col">Numero de reproduciones</th>
      			<th scope="col"></th>
      			<th scope="col">Detalles</th>
      			<th scope="col"></th>
    		</tr>
  		</thead>
  		<tbody>
    			<c:forEach items="${videos}" var="v">
					<tr>
						<th scope="row">${v.id}</th>
						<td>${v.nombre}</td>
						<td>${v.codigo}</td>
						<td>${v.reproduciones}</td>
						<td><a class="btn btn-primary btn-block mb-2" href="crearVideo?op=2&id=${v.id}">Modificar</a></td>
						<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      					<td><a class="btn btn-danger btn-block mb-2" href="crearVideo?op=4&id=${v.id}">Eliminar</a></td>
					</tr>
				</c:forEach>
					<tr>
						<th scope="row">##</th>
						<td>Nuevo Video</td>
						<td>Nuevo Codigo</td>
						<td>Nº de reproducciones</td>
						<td><a class="btn btn-primary btn-block mb-2" href="crearVideo?op=2&id=${v.id}">Modificar</a></td>
						<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      					<td><a class="btn btn-danger btn-block mb-2"" href="crearVideo?op=4&id=${v.id}">Eliminar</a></td>
					</tr>
				
  		</tbody>
	</table>

<%@include file="../includes/footer.jsp" %>