<%@page import="com.ipartek.formacion.controller.YoutubeController"%>

<%@page import="com.ipartek.formacion.model.dao.VideoDAO"%>
<%@page import="com.ipartek.formacion.model.pojo.Video" %>
<%@page import="java.util.ArrayList" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Listado de Videos</h1>
	
	<%@include file="../includes/mensaje.jsp"%>
	
	<form class="form-inline mb-2" action="crearVideo" method="get">
		<label class="sr-only" for="buscar">Video a buscar</label>
		<input class="form-control col-md-4" type="search" name="buscar" id="buscar" value="${buscar}" placehorder="Inserte el video a buscar" required>
		<button class="btn btn-primary ml-2" type="submit"><i class="fas fa-search"></i></button>
		<a href="crearVideo?op=<%=YoutubeController.OP_CREARNUEVO%>" class="btn btn-primary ml-2 mb-1">+ Nuevo Video</a>
	</form>
	
	<table class="table">
  		<thead>
    		<tr>
    			<th scope="col"></th>
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
						<th scope="row"><img class="rounded-pill" alt="${v.nombre}" src="https://img.youtube.com/vi/${v.codigo}/default.jpg"></th>
						<th>${v.id}</th>
						<td>${v.nombre}</td>
						<td>${v.codigo}</td>
						<td>${v.reproduciones}</td>
						<td><a class="btn btn-primary btn-block mb-2" href="crearVideo?op=<%=YoutubeController.OP_MODIFICAR%>&id=${v.id}"><i class="far fa-edit"></i></a></td>
						<td><a class="btn btn-success btn-block mb-2" href="crearVideo?op=<%=YoutubeController.OP_DETALLE%>&id=${v.id}"><i class="fas fa-film"></i></a></td>
      					<td>
      						<!-- Button trigger modal -->
      						<button type="button" class="btn btn-danger btn-block mb-2" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-trash-alt"></i></button>
      						
      						<!-- Modal -->
      						<div class="modal" tabindex="-1" role="dialog">
  								<div class="modal-dialog" role="document">
    								<div class="modal-content">
      									<div class="modal-header">
        									<h5 class="modal-title">¿Estas seguro que deseas eliminar el video?</h5>
        									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          										<span aria-hidden="true">&times;</span>
        									</button>
      									</div>
      									<div class="modal-body">
        									<p>Esta operación no es reversible</p>
      									</div>
      									<div class="modal-footer">
        									<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        									<a class="btn btn-danger btn-block mb-2" href="crearVideo?op=<%=YoutubeController.OP_ELIMINAR%>&id=${v.id}"><i class="fas fa-trash-alt"></i></a>
      									</div>
    								</div>
  								</div>
							</div>
      					
      					</td>
					</tr>
				</c:forEach>
					<tr>
						<th scope="row"></th>
						<th>##</th>
						<td>Nuevo Video</td>
						<td>Nuevo Codigo</td>
						<td>Nº de reproducciones</td>
						<td></td>
						<td></td>
      					<td></td>
					</tr>
				
  		</tbody>
	</table>

<%@include file="../includes/footer.jsp" %>