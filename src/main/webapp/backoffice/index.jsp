<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>


<%@include file="../includes/mensaje.jsp"%>

<h2>Bienvenido a nuestra Application: IparTube</h2>
<form action="crearVideos" method="get">
	<div class="btn-group">
  		<button class="btn btn-info btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    		IparTube Options
  		</button>
  		<div class="dropdown-menu">
    		<a class="dropdown-item" href="crearVideo?op=0">Listado de Videos</a>
	        <a class="dropdown-item" href="crearVideo?op=1">Crear Video</a>
  		</div>
	</div>
</form>
<%@include file="../includes/footer.jsp" %>