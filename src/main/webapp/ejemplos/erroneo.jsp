<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

<%@ page errorPage="error.jsp" %>

	<h1>Errores del sistema</h1>
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Error 404</h2>
		<p>Este error se produce cuando no se puede encontrar la pagina o la ruta esta mal, por lo que enviara a nuestra JSP Error 404 costumizada</p>
		<p>En este caso el ancla tiene como destino el "error404.jsp" una JSP inexistente</p>
		<a class="btn btn-outline-primary" href="error404.jsp">Pincha aquí y se produce un error 404</a>
	</section>
	<section class="p-3 mb-3 bg-light shadow">
	<h2>Error 500</h2>
		<p>Este error se produce cuando se produce un problema en los servlet o en cualquier parte del servidor. Es un fallo interno y enviara a la JSP costumizada del Error 500.</p>
		<p>En este caso el enlace lleva a la error.jsp que tiene el siguiente codigo: <code>&lt;%int number = Integer.parseInt("Hello, World!");%&gt;</code></p>
		<a class="btn btn-outline-info" href="ejemplos/error.jsp">Pincha aquí y se produce un error 500</a>
	</section>
		
<%@include file="../includes/footer.jsp" %>