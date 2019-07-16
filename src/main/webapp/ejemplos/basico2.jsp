<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Ejemplo de Servlet Basico con JSP</h1>
	<p>Vamos a comprobar con que navegador estamos usando haciendo una request al servidor y se muestra en pantalla cual es el navegador y además si es un mvil o no, mediante el boton siguiente:</p>

	<a href="useragent" class="btn-outline-primary">Detectar navegador que estas usando</a>
	<h2>Respuesta</h2>
	<p>${navegador }</p>
	<p>${movil }</p>

<%@include file="../includes/footer.jsp" %>