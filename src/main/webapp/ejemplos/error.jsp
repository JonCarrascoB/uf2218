<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

<%@ page isErrorPage="true"%>

	<h1>Error Page</h1>
	<p>Este fichero JSP es una p�gina que maneja excepciones. Recoge el error de otra .jsp</p>
	
	<p>Error exception: <%=exception.getMessage()%></p>

	
<%@include file="../includes/footer.jsp" %>