<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

<h1>Sign in</h1>
<%@include file="../includes/mensaje.jsp"%>

<form action="user" method="post">
	<div class="form-group">
    	<label for="id">ID</label>
    	<input type="text" class="form-control" name="id" id="id" value="${usuario.id}" readonly>
  	</div>
  	<div class="form-group">
    	<label for="usuario">Usuario</label>
    	<input type="text" class="form-control" name="id" id="usuario" value="${usuario.name}">
  	</div>
  	<div class="form-group">
    	<label for="contraseña">Password</label>
    	<input type="text" class="form-control" name="pass" id="contraseña" value="${usuario.password}">
  	</div>
	<input type="submit" value="${(usuario.id != -1)? 'Modificar':'Crear'}">
  	<input type="reset" class="btn btn-danger" value="Eliminar datos">
</form>

<%@include file="../includes/footer.jsp" %>