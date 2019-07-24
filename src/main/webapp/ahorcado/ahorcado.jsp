<%@page import="com.ipartek.formacion.controller.AhorcadoController"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Ahorcado</h1>
	<%@include file="../includes/mensaje.jsp"%>
	
	<form action="ahorcado" method="post" class="mb-2">
		<div class="form-group" name="op" value="<%=AhorcadoController.OP_PALABRA%>">
    		<label for="palabra">Inserte una palabra:</label>
    		<input type="text" class="form-control" name="char" id="palabra" placeholder="Introduce una palabra a adivinar" >
  		</div>
	
		<div class="form-group" name="op" value="<%=AhorcadoController.OP_COMPROBAR%>">
    		<label for="char">Inserte una letra:</label>
    		<input type="text" class="form-control" name="char" id="char" placeholder="Introduce una letra a comprobar" >
  		</div>
  		<input type="submit" class="btn btn-primary" value="Comprobar">
  	</form>
  	
  	<div>
		<h4></h4>
		<p>Has acertado tantas letras de la palabra: ${caracter}</p>
		<p>Te quedan las siguientes vidas: ${intentosTot}/7</p>
		
		<img alt="Ahorcado" src="">
		
	
	</div>
	

<%@include file="../includes/footer.jsp" %>