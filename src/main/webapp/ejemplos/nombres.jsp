<%@page import="java.util.ArrayList" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

<div class=row>
	<div class="col-8">
		<h2>Listado de nombres</h2>
		<form action="nombres" method="get">
			<input type="text" name="buscar" id="buscar" placehorder="Dime tu nombre">
			<button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
		</form>
		<ul>
			<%ArrayList<String> listNames = (ArrayList<String>) request.getAttribute("nombres");
			if(listNames != null){
				for(int i=0; i<listNames.size();i++){
					%><li> <%=listNames.get(i) %></li><%
				}
			} else{
				%><p>No hay nombres en la lista</p>
			<%}%>
		</ul>
		<p> <%=request.getAttribute("nombreBuscado")%></p>
	</div>
	<div class="col-4">
		<h2>Introducir nombre</h2>
		<form action="nombres" method="post">
			<input type="text" name="nombre" placehorder="Dime tu nombre" required>
			<br>
			<input type="submit" value="Guardar">
		</form>
	</div>
</div>



<%@include file="../includes/footer.jsp" %>