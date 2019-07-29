<%@include file="includes/header.jsp" %>
<%@include file="includes/navbar.jsp" %>

  		<h1 class="text-success">Hello Java Web App 3.5</h1>
  		
  		<%@include file="../includes/mensaje.jsp"%>
  		
  		<section class="p-3 mb-3 bg-light shadow">
  			<div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   					Ejemplos de Teoria
  				</button>
  				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    				<a class="dropdown-item" href="ejemplos/basico.jsp">Ejemplo de Servlet Basico sin JSP</a>
    				<a class="dropdown-item" href="ejemplos/basico2.jsp">Ejemplo de Servlet Basico con JSP</a>
    				<a class="dropdown-item" href="ejemplos/basico3.jsp">Ejemplo de Servlet Content Type</a>
    				<a class="dropdown-item" href="ejemplos/basico5.jsp">Get y Post</a>
    				<a class="dropdown-item" href="ejemplos/erroneo.jsp">Error Page</a>
    				<a class="dropdown-item" href="ejemplos/el.jsp">EL - Expression Lenguages</a>
    				<a class="dropdown-item" href="ciclovida">Ciclo de vida de un Servelet</a>
    				<a class="dropdown-item" href="jsp">JSP</a>
    				<a class="dropdown-item" href="jstl">JSTL - Java Server Tag Libreries</a>
    				<a class="dropdown-item" href="ejemplos/session.jsp">Session</a>
    				<a class="dropdown-item" href="ejemplos/filtros.jsp">Filtros</a>
    				<a class="dropdown-item" href="ejemplos/listeners.jsp">Listeners o escuchadores de eventos</a>
    				<a class="dropdown-item" href="ejemplos/redireccion.jsp">Redireccion</a>
    				<a class="dropdown-item" href="i18n">I18N</a>
    				<a class="dropdown-item" href="ejemplos/cookies.jsp">Cookies</a>
  				</div>
			</div>
  		</section>
  		<section class="p-3 mb-3 bg-light shadow">
  			<div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   					Otros ejemplos
  				</button>
  				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    				<a class="dropdown-item" href="nombres">Ejercicio nombres</a>
    				<a class="dropdown-item" href="calculadora/calculator.jsp">Iparlator, tu calculadora Web</a>
    				<a class="dropdown-item" href="ahorcado/ahorcado.jsp">Ahorcado</a>
  				</div>
			</div>
  		</section>
  		<!--  
  		<ul class="list-group text-primary">
  			<li class="list-group-item"><a href="ejemplos/basico.jsp">Ejemplo de Servlet Basico sin JSP</a></li>
  			<li class="list-group-item"><a href="ejemplos/basico2.jsp">Ejemplo de Servlet Basico con JSP</a></li>
  			<li class="list-group-item"><a href="ejemplos/basico3.jsp">Ejemplo de Servlet Content Type</a></li>
  			<li class="list-group-item"><a href="ejemplos/basico5.jsp">Get y Post</a></li>
  			<li class="list-group-item"><a href="nombres">Ejercicio nombres</a></li>
  			<li class="list-group-item"><a href="ejemplos/erroneo.jsp">Error Page</a></li>
  			<li class="list-group-item"><a href="ejemplos/el.jsp">EL - Expression Lenguages</a></li>
  			<li class="list-group-item"><a href="ciclovida">Ciclo de vida de un Servelet</a></li>
  			<li class="list-group-item"><a href="jsp">JSP</a></li>
  			<li class="list-group-item"><a href="jstl">JSTL - Java Server Tag Libreries</a></li>
  			<li class="list-group-item"><a href="ejemplos/session.jsp">Session</a></li>
  			<li class="list-group-item"><a href="ejemplos/cookies.jsp">Cookies</a></li>
  			<li class="list-group-item"><a href="ejemplos/filtros.jsp">Filtros</a></li>
  			<li class="list-group-item"><a href="ejemplos/listeners.jsp">Listeners o escuchadores de eventos</a></li>
			<li class="list-group-item"><a href="ejemplos/redireccion.jsp">Redireccion</a></li>
			<li class="list-group-item"><a href="calculadora/calculator.jsp">Iparlator, tu calculadora Web</a></li>
			<li class="list-group-item"><a href="ahorcado/ahorcado.jsp">Ahorcado</a></li>
		</ul>
  	-->
<%@include file="includes/footer.jsp" %>