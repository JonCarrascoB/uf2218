<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  		<a class="navbar-brand" href="#">JEE</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>

  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    		<ul class="navbar-nav mr-auto">
      			<li class="nav-item active">
        			<a class="nav-link" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
      			</li>
      			<c:if test="${usuario != null }">
	      			<!-- <li class="nav-item dropdown"> -->
	        			<a class="nav-link" href="backoffice/index.jsp">Youtube</a>
	        			<!-- <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          				<a class="dropdown-item" href="crearVideo?op=0">Listado de Videos</a>
	          				<a class="dropdown-item" href="crearVideo?op=1">Crear Video</a>
	        			</div>
	      			</li> -->
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
	<!-- Fin del navbar -->
  
  	<main class="container">