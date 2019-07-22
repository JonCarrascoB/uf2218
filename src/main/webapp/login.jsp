<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Login</h1>
	<%@include file="../includes/mensaje.jsp"%>
	
	<form action="login" method="post">
		<div class="form-group">
    		<label for="nombre">Usuario:</label>
    		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Tu nombre de usuario" >
  		</div>
		<div class="form-group">
    		<label for="password">Contrase�a:</label>
    		<input type="password" class="form-control" name="contrase�a" id="password" placeholder="Password">
  		</div>
		<input type="submit" value="Entrar">
	</form>


<%@include file="../includes/footer.jsp" %>