<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>Internalizacion - I18n</h1>
	
	<h2>Recuperar properties desde el servlet</h2>
	<p>Mediante este protocolo podemos modificar el lenguaje en el que vamos a tener la appweb. Crearemos un folder llamado "i18n" en el folder "src/main/resources".</p>
	<p>Crearemos los file "i18nmessages_lenguaje_COUNTRY.propierties", uno para cada idioma.</p>
	<p>Creamos el servlet "IdiomasController" donde se controlara que idioma es el que se ha designado y que archivo propierties se tiene que usar, designando el locale y cargando el fichero, asi como los atributos para la JSP</p>
	<p>El codigo introducido en el controller, en el doGet es el siguiente:</p>
	<p>
		<pre><code>
		Locale locale;
		String idiomaSeleccionado = request.getParameter("idiomaSeleccionado");
		String ruta = request.getParameter("ruta");
		ruta = ruta.split("uf2218/")[1];
		
		String lenguage = "en";
		String country = "EN";
		
		if (idiomaSeleccionado != null) {
			lenguage = idiomaSeleccionado.split("_")[0];
			country = idiomaSeleccionado.split("_")[1];
		}
		
		
		locale = new Locale(lenguage, country);
		ResourceBundle properties = ResourceBundle.getBundle ( "i18n/i18nmessages", locale );
		
		//guardar en sesion el idioma selecionado para las jsps
		HttpSession session = request.getSession();
		session.setAttribute("locale", idiomaSeleccionado);
		
		request.setAttribute("mensajeInicio", properties.getString("menu.inicio"));
		
		if(ruta != null) {
			request.getRequestDispatcher(ruta).forward(request, response);
		} else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		</code></pre>
	</p>
	<p>Por ultimo se comprueba:</p>
	
	<h3>Idiomas</h3>

	<ol>
		<li><a href="i18n?idiomaSeleccionado=en_EN"><img alt="GB" src="https://cdn.icon-icons.com/icons2/45/PNG/64/uk_flags_flag_9094.png"></a></li>
		<li><a href="i18n?idiomaSeleccionado=es_ES"><img alt="ES" src="https://cdn.icon-icons.com/icons2/45/PNG/64/Spain_flags_flag_8858.png"></a></li>
		<li><a href="i18n?idiomaSeleccionado=eu_ES"><img alt="EU" src="https://cdn.icon-icons.com/icons2/45/PNG/64/Basquecountry_flags_flag_9313.png"></a></li>
	</ol>
	
	<p class=" h3 text-danger">Ahora, solo hay que pinchar en los iconos de idiomas del navbar y se pintan los resultados según el idioma deseado.</p>
	
	${mensajeInicio}
	
	<h2>Recuperar properties desde la jsp</h2>
	
	<p>El primer paso es colocar en el header la siguiente libreria: <code>&lt;%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%&gt;</code></p>
	<p>Se crea una variable "locale" para que recoja el idioma desde la sesión</p>
	<pre><code>
			&lt;c:set  var="locale" 
			value="${not empty sessionScope.locale ? sessionScope.locale : 'es_ES'}" 
			scope="session" /&gt;
			</code></pre>
	<p>El siguiente paso es declarar el locale, con la linea: <code>&lt;fmt:setLocale value="${locale}" /&gt;</code></p>
	<p>Tras lo que se carga el fichero de las properties, con la linea: <code>&lt;fmt:setBundle basename="i18n.i18nmessages" /&gt;</code></p>
	<p>Todo lo anterior se encuentra en el header de toda la Appweb, para que se gestione de forma inicial</p>
	<p>Por ultimo en la JSP se hace la llamada a la Key, con la linea: <code>&lt;fmt:message key="menu.ejemplos" /&gt;</code></p>
	
	<% //@see ver el header para gestion del idioma %>
	
	<p>locale: ${locale}</p>
	
	<p class="h3 text-danger"><fmt:message key="menu.ejemplos" /></p>
	<p class="h3 text-danger"><fmt:message key="menu.inicio" /></p>
	
	
	

<%@include file="../includes/footer.jsp" %>