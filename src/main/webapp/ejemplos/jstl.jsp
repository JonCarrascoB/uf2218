<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

	<h1>JSTL - Java Server Tag Libreries</h1>
	<section class="p-3 mb-3 bg-light shadow">
		<p>JavaServer Pages (JSP) es una tecnología que ayuda a los desarrolladores de software a crear páginas web dinámicas basadas en HTML y XML, entre otros tipos de documentos. JSP es similar a PHP, pero usa el lenguaje de programación Java.</p>
		<p class="text-danger">*recordar insertar las Tag Libreries <code>taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"</code></p>
		<a href="https://www.tutorialspoint.com/jsp/jsp_standard_tag_library.htm" target="_blank">Documentacion y ejemplos</a>
	</section>
	<section class="p-3 mb-3 bg-light shadow">
		<h2>&lt;c:foreach&gt;</h2>
		<p>Sirve para iterar sobre una coleccion para no tener que usar <code>&lt;% ... %&gt;></code> scriptles</p>
		<p>Usando EL con el <code>&dollar;colores</code> => ${colores }</p>
		
		<ol>
			<c:forEach items="${colores }" var="color">
				<li>${color}</li>
			</c:forEach>
		</ol>

	</section>
	<section class="p-3 mb-3 bg-light shadow">
		<h2>&lt;c:if&gt;</h2>
		<p>Sirve para realizar condicionales if simples, pero no aquellos que vayan con else if</p>
		<c:if test="${isLunes}">Hoy es lunes</c:if>
		<c:if test="${!isLunes}">Hoy NO es lunes</c:if>
	</section>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>&lt;c:choose&gt;</h2>
		<p>Sirve para realizar condiciones con else if, es un switch</p>
			<c:choose >
				<c:when test="${isAprobado}">
					<div class="alert alert-${alerta.tipo} alert-dismissible fade show" role="alert">
  						${alerta.texto}
  					</div>
  				</c:when>
  				<c:when test="${!isAprobado}">
					<div class="alert alert-${alerta2.tipo} alert-dismissible fade show" role="alert">
  						${alerta2.texto}
  					</div>
				</c:when>
			</c:choose>
		
<%@include file="../includes/footer.jsp" %>