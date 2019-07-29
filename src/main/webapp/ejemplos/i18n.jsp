<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Internalizacion - I18n</h1>
	
	<h2>Recuperar properties desde el servlet</h2>
	<p>Mediante este protocolo podemos modificar el lenguaje en el que vamos a tener la appweb. Crearemos un folder llamado "i18n" en el folder "src/main/resources".</p>
	<p>Crearemos los file "i18nmessages_lenguaje_COUNTRY.propierties", uno para cada idioma.</p>
	<p>Creamos el servlet "IdiomasController"</p>
	<p></p>
	<p></p>
	<p></p>
	
	<h2>Recuperar properties desde el servlet</h2>
	<h3>Idiomas</h3>
	${mensajeIdiomas}

	<ol>
		<li><a href="i18n?idiomaSeleccionado=en_EN"><img alt="GB" src="https://cdn.icon-icons.com/icons2/45/PNG/64/uk_flags_flag_9094.png"></a></li>
		<li><a href="i18n?idiomaSeleccionado=es_ES"><img alt="ES" src="https://cdn.icon-icons.com/icons2/45/PNG/64/Spain_flags_flag_8858.png"></a></li>
		<li><a href="i18n?idiomaSeleccionado=eu_ES"><img alt="EU" src="https://cdn.icon-icons.com/icons2/45/PNG/64/Basquecountry_flags_flag_9313.png"></a></li>
	</ol>
	
	${mensajeInicio}
	
	<h2>Recuperar properties desde la jsp</h2>
	
	<p>El primer paso es colocar en el header la siguiente libreria: <code>&lt;%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%&gt;</code></p>
	<p>Se crea una variable "locale" para que recoja el idioma desde la sesión</p>
	<pre><code>&lt;c:set  var="locale" 
			value="${not empty sessionScope.locale ? sessionScope.locale : 'es_ES'}" 
			scope="session" /&gt;</code></pre>
	<p>El siguiente paso es declarar el locale, con la linea: <code>&lt;fmt:setLocale value="${locale}" /&gt;</code></p>
	<p>Tras lo que se carga el fichero de las properties, con la linea: <code>&lt;fmt:setBundle basename="i18n.i18nmessages" /&gt;</code></p>
	<p>Todo lo anterior se encuentra en el header de toda la Appweb, para que se gestione de forma inicial</p>
	<p>Por ultimo en la JSP se hace la llamada a la Key, con la linea: <code>&lt;fmt:message key="menu.ejemplos" /&gt;</code></p>
	
	<% //@see ver el header para gestion del idioma %>
	
	<p>locale: ${locale}</p>
	
	<p class="h3 text-danger"><fmt:message key="menu.ejemplos" /></p>
	<p class="h3 text-danger"><fmt:message key="menu.inicio" /></p>
	
	
	

<%@include file="../includes/footer.jsp" %>