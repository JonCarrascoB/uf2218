<%@page import="java.util.ArrayList" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Ejercicio Nombres</h1>
	
	<%@include file="../includes/mensaje.jsp"%>
	
	<div class=row>
		<div class="col-8">
			<section class="shadow p-4">
				<h2>Listado de nombres</h2>
				<form class="form-inline mb-2" action="nombres" method="get">
					<label class="sr-only" for="buscar">Nombre</label>
					<input class="form-control col-md-4" type="search" name="buscar" id="buscar" value="${buscar}" placehorder="Dime tu nombre" required>
					<button class="btn btn-primary ml-2" type="submit"><i class="fas fa-search"></i></button>
					<a href="nombres" class="btn btn-danger ml-2 mb-1">Limpiar filtro</a>
				</form>
			
				<% if(request.getAttribute("buscar")!= null){ %>	
  					<p class=text-muted">Resultado de la busqueda de <strong>${buscar}</strong></p>	
				<%} %>
				
				
				<!-- <button class="btn btn-primary ml-2" type="reset"><i class="fas fa-times"></i></button> -->
				
				<ul class="list-group">
					<%ArrayList<String> listNames = (ArrayList<String>) request.getAttribute("nombres");
					if(listNames != null){
						for(String nombre : listNames){
							%><li class="list-group-item"> <%=nombre %></li><%
						} //end for
					} else{
						%><li class="list-group-item">No hay nombres en la lista</li>
					<%}%>
				</ul>
			</section>
		</div>
		
		<div class="col-4 border-success">
			<section class="shadow p-2">
				<h2>Introducir nombre</h2>
				<form action="nombres" method="post">
					<label class="sr-only" for="nombre">Inserte un nuevo nombre: </label>
					<input class="form-control col-md-4" type="text" name="nombre" id="nombre" placehorder="Dime tu nombre" required>
					<input class="mt-2" type="submit" value="Guardar">
				</form>
			</section>
		</div>
	</div>


<%@include file="../includes/footer.jsp" %>