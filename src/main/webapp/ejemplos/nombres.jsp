<%@page import="java.util.ArrayList" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Ejercicio Nombres</h1>
	
	<div class="alert alert-${mensaje.tipo} alert-dismissible fade show" role="alert">
  		<strong>${mensaje.text}</strong>
  		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    		<span aria-hidden="true">&times;</span>
  		</button>
	</div>
	
	<div class=row>
		<div class="col-8">
			<section class="shadow p-4">
				<h2>Listado de nombres</h2>
				<form class="form-inline mb-2" action="nombres" method="get">
					<label class="sr-only" for="buscar">Nombre</label>
					<input class="form-control col-md-4" type="search" name="buscar" id="buscar" value="${buscar}" placehorder="Dime tu nombre" required>
					<button class="btn btn-primary ml-2" type="submit"><i class="fas fa-search"></i></button>
				</form>
			
				<% if(request.getAttribute("buscar")!= null){ %>
				<p class=text-muted">Resultado de la busqueda de <strong>${buscar}</strong></p>
				<%} %>
			
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
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
  					<strong>${mensajeFail}</strong>
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    					<span aria-hidden="true">&times;</span>
  					</button>
				</div>
				<div class="alert alert-success alert-dismissible fade show" role="alert">
  					<strong>${mensajeOk}</strong>
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    					<span aria-hidden="true">&times;</span>
  					</button>
				</div>
			</section>
		</div>
	</div>


<%@include file="../includes/footer.jsp" %>