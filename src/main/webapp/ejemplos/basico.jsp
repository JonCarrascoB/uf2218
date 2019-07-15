<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Ejemplo de Servlet Basico sin JSP</h1>
	<p>Vamos a crear un servlet para demostrar las request y la response.</p>
	<p>El servlet será el encargado de printar la respuesta a pelo sin usar una JSP.</p>
	
	<a class="btn btn-primary btn-block mb-2" href="controlador1">Peticion GET</a>
	
	<a class="btn btn-primary btn-block mb-2" href="controlador1?param1=value1&param2=foo&p3=manolito">Peticion GET con parametros</a>
	
	<a class="btn btn-danger btn-block mb-2" href="controladorNoexistente">Peticion GET - response 404</a>
	
<%@include file="../includes/footer.jsp" %>