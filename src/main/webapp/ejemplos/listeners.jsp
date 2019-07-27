<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Listeners</h1>
	<p>estan diseñados para escuchar los diferentes eventos que se producen en el ciclo de vida de la aplicacion web. Existen tres tipos:</p>
	<ul>
		<li>ServletContextListener: Listener que se encarga de gestionar los eventos generales de la aplicación como son arranque y parada de la App Web.</li>
		<li>HttpSessionListener :Listener que se encarga de gestionar los propios eventos de la sessión como creación ,invalidación y destrucción de sessiones.</li>
		<li>ServletRequestListener : Listener que se encarga de los eventos de creación y destruccion de peticiones del usuario.</li>
	</ul>
	
	<h3>Ejemplo de Listener</h3>
	<p>Se pintan los usuarios que se hn logeado en la pagina</p>
	<ul>
	<c:forEach items="${UsuariosLogeadosListener.usuariosLogeados}" var="v">
		<li>${v}</li>	
	</c:forEach>
</ul>
	
<%@include file="../includes/footer.jsp" %>