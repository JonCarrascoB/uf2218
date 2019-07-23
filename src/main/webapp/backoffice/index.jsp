<%@page import="com.ipartek.formacion.controller.listener.UsuariosLogeadosListener"%>
<%@include file="../includes/header.jsp" %>
<meta http-equiv="refresh" content="3">
<%@include file="../includes/navbar.jsp" %>


<%@include file="../includes/mensaje.jsp"%>

<h2>Bienvenido a nuestro BackOffice</h2>

<ul>
	<c:forEach items="${UsuariosLogeadosListener.usuarios}" var="v">
		<li>${v}</li>	
	</c:forEach>
</ul>

<%@include file="../includes/footer.jsp" %>