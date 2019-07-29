<%@page import="com.ipartek.formacion.controller.backoffice.YoutubeController"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  		<a class="navbar-brand" href="#">JEE</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>

  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    		<ul class="navbar-nav mr-auto">
      			<li class="nav-item active">
        			<a class="nav-link" href="index.jsp"><fmt:message key="menu.inicio" /> <span class="sr-only">(current)</span></a>
      			</li>	
				<li class="nav-item dropdown">
        			<a class="nav-link dropdown-toggle" href="backoffice/crearVideo?op=0" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          				Youtube
        			</a>
        			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          				<a class="dropdown-item" href="backoffice/crearVideo?op=0"><fmt:message key="youtube.listado" /></a>
	        			<a class="dropdown-item" href="backoffice/crearVideo?op=1"><fmt:message key="youtube.nuevo" /></a>
  					</div>
      			</li>
      			<c:if test="${usuario != null }">
      				<li class="nav-item active">
      					<a class="nav-link" href="backoffice/index.jsp">BackOffice</a>
      				</li>	
      			</c:if>   		
      		</ul>
      		<c:if test="${usuario == null }">
      			<a class="nav-link text-white" href="login.jsp">Login <span class="sr-only">(current)</span><i class="fas fa-user"></i></a>
      			<a class="nav-link text-white" href="user">Sign in <span class="sr-only">(current)</span><i class="fas fa-sign-in-alt"></i></a>
      		</c:if>
        	<c:if test="${usuario != null }">
        		<span class="text-white">${usuario}</span>
      			<a class="nav-link text-white" href="logout">Logout <span class="sr-only">(current)</span><i class="fas fa-sign-out-alt"></i></a>
      		</c:if>
  		</div>
	</nav>
	
	<nav class="bg-dark">
		<a href="i18n?idiomaSeleccionado=en_EN&ruta=${pageContext.request.requestURI}"><img alt="GB" src="resources/images/british.png" class="${sessionScope.locale != 'en_EN' ? 'inactive': ''  }"></a>
		<a href="i18n?idiomaSeleccionado=es_ES&ruta=${pageContext.request.requestURI}"><img alt="ES" src="resources/images/Spain.png" class="${sessionScope.locale != 'es_ES' ? 'inactive': ''  }"></a>
		<a href="i18n?idiomaSeleccionado=eu_ES&ruta=${pageContext.request.requestURI}"><img alt="EU" src="resources/images/euskadi.png" class="${sessionScope.locale != 'eu_ES' ? 'inactive': ''  }"></a>
    </nav>
	<!-- Fin del navbars -->
  
  	<main class="container">