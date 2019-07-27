
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Filtros</h1>
	<p>Siempre nos surge la necesidad de desarrollar la seguridad o controlar los “eventos” de navegación, para este caso existen los Filtros, un filtro permite que determinada petición o respuesta sea analizada bajo ciertas condiciones.</p>
	<p>Una de las principales características de un filtro es que puede ser colocado en cualquier punto del flujo de la aplicación, ya sea entre una solicitud de JSP a JSP, Servlet a Servlet, o inclusive Servlet/JSP a HTML, la única condición que debe cumplirse es que debe existir un objeto de entrada (ServletRequest) y otro de salida (ServletResponse).</p>
	
	<h3>Filtro de seguridad</h3>
	<p>Es un filtro que comprueba si hay un usuario logeado en la aplicacion o no. En el caso de que exista el usuario, el filtro permite ver las secciones que se encunetran dentro del backoffice</p>
	<p>en el caso de que no haya un usuario logeado el filtro redirecciona al login.jsp. Vease el "FilterSeguridad.java"</p>
	
<%@include file="../includes/footer.jsp" %>