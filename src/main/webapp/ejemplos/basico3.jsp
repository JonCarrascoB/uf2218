<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Ejemplo de Servlet Response Content Type</h1>
	<p>VUn user de Java siempre responde por defecto con <code>text/html</code>, pero se puede cambiar</p>
	<p>Listado de los content type posibles: <a href="https://developer.mozilla.org/es/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Lista_completa_de_tipos_MIME">Conten-type</a></p>
	
	<p>Vamos a responder desde server los mismos datos, pero con diferentes content-type</p>
	<p>Datos: perro [nombre="bubba", raza="boxer"]</p>
	
	<a href="servlet3?p=1" class="btn btn-outline-primary">Respuesta text/plain</a>
	<a href="servlet3?p=2" class="btn btn-outline-dark">Respuesta text/html</a>
	<a href="servlet3?p=3" class="btn btn-outline-success">Respuesta application/pdf</a>
	<a href="servlet3?p=4" class="btn btn-outline-darger">Respuesta aplication/json</a>
	
	<h2>Respuesta</h2>
	

<%@include file="../includes/footer.jsp" %>