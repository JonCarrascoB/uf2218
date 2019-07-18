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
		<a href="crearVideos?op=2" class="btn btn-primary ml-2 mb-1">+ Nuevo Video</a>
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
    		<%
    		ArrayList<Video> listVideo = (ArrayList<Video>) request.getAttribute("videos");
    				if(listVideo != null){
    		    				for(Video v : listVideo){
    		%>
					<tr>
						<th scope="row"><%=v.getId()%></th>
						<td><%=v.getNombre() %></td>
						<td><%=v.getCodigo() %></td>
						<td><%=v.getReproduciones()%></td>
						<td><a class="btn btn-primary btn-block mb-2" href="crearVideo?op=3&id=<%=v.getId()%>">Modificar</a></td>
						<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      					<td><a class="btn btn-danger btn-block mb-2" href="crearVideo?op=4&id=<%=v.getId()%>">Eliminar</a></td>
					</tr>
					<%}
				} else {
					%>
					<tr>
						<th scope="row">##</th>
						<td>Nuevo Video</td>
						<td>Nuevo Codigo</td>
						<td>Nº de reproducciones</td>
						<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      					<td><a class="btn btn-danger btn-block mb-2" href="crearVideo">Eliminar</a></td>
					</tr>
				<%}%>
  		</tbody>
	</table>

<%@include file="../includes/footer.jsp" %>