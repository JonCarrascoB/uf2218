<%@page import="java.util.ArrayList"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Ciclo de Vida de un Servlet</h1>
	<section class="p-3 mb-3 bg-light shadow">
		<img src="resources/images/ciclo_vida_servlet.jpg" alt="ciclo de vida de un Servlet">
	</section>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Primera peticion - init()</h2>
		<p>Se inicia el servlet introduciendo los datos del ArrayList perros</p>
		<ul class="list-group">
			<%ArrayList<String> listDogs = (ArrayList<String>) request.getAttribute("perros");
					if(listDogs != null){
						for(String perro : listDogs){
							%><li class="list-group-item"> <%=perro %></li><%
						} //end for
					} else{
						%><li class="list-group-item">No hay nombres en la lista</li>
					<%}%>
				</ul>
	</section>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Siguientes Peticiones - Service()</h2>
	</section>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Get()</h2>
		<p>Buscamos un perro</p>
		<form class="form-inline mb-2" action="nombres" method="get">
			<label class="sr-only" for="buscar">Nombre</label>
			<input class="form-control col-md-4" type="search" name="buscar" id="buscar" value="${buscar}" placehorder="Dime tu nombre" required>
			<button class="btn btn-primary ml-2" type="submit"><i class="fas fa-search"></i></button>
		</form>
			
			<% if(request.getAttribute("buscar")!= null){ %>
			<p class=text-muted">Resultado de la busqueda de <strong>${buscar}</strong></p>
			<%} %>
			
			<ul class="list-group">
				<%ArrayList<String> listDogs2 = (ArrayList<String>) request.getAttribute("perros");
				if(listDogs2 != null){
					for(String perro : listDogs2){
						%><li class="list-group-item"> <%=perro %></li><%
						} //end for
					} else{
						%><li class="list-group-item">No hay nombres en la lista</li>
					<%}%>
			</ul>	
	</section>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Post()</h2>
		<p>Introducimos un nuevo perro</p>
		<form action="nombres" method="post">
			<label class="sr-only" for="nombre">Inserte un nuevo nombre: </label>
			<input class="form-control col-md-4" type="text" name="nombre" id="nombre" placehorder="Dime tu nombre" required>
			<input class="mt-2" type="submit" value="Guardar">
		</form>
		<ul class="list-group">
			<%ArrayList<String> listDogs3 = (ArrayList<String>) request.getAttribute("perros");
				if(listDogs3 != null){
					for(String perro : listDogs3){
						%><li class="list-group-item"> <%=perro %></li><%
					} //end for
				} else{
					%><li class="list-group-item">No hay nombres en la lista</li>
				<%}%>
		</ul>
	</section>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Fin - destroy()</h2>
	</section>
	
<%@include file="../includes/footer.jsp" %>