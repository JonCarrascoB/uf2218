<%@page import="com.ipartek.formacion.controller.AhorcadoController"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Ahorcado</h1>
	<%@include file="../includes/mensaje.jsp"%>
	
	<c:if test="${palabra == null }">
		<form action="ahorcado" method="post" class="mb-2">
			<div class="form-group">
	    		<input type="hidden" class="form-control" name="op" id="op" maxlength="1" value="<%=AhorcadoController.OP_PALABRA %>">
	 		</div>
	  		<div class="form-group">
	    		<label for="palabra">Palabra</label>
	    		<input type="password" class="form-control" name="palabra" id="palabra"  placeholder="Introducela palabra a adiviniar">
	  		</div>
	  		<button type="submit" class="btn btn-primary">Play</button>
	  	</form>
  	</c:if>
  	<c:if test="${palabra != null }">
	  	<form action="ahorcado"  method="post">
	  		<div class="form-group">
	    		<input type="hidden" class="form-control" name="op" id="op" maxlength="1" value="<%=AhorcadoController.OP_COMPROBAR %>">
	  		</div>
	  		<div class="form-group">
	    		<label for="letra">Letra</label>
	    		<input type="text" class="form-control" name="letra" id="letra" maxlength="1" placeholder="Introducela la letra">
	  		</div>
	  
	  		<button type="submit" class="btn btn-primary">Comprobar</button>
		</form>
	
		<div class="row mt-2">
			<div class="col-03">
			<c:forEach items="${respuesta}" var="letras">
				${letras}
			</c:forEach>
			</div>
			<div class="col-09">
				<p>Te quedan las siguientes vidas: ${vidas}/7</p>
				<img alt="${imagen}" src="resources/images/ahorcadoImg/${imagen}.png">
			</div>
		</div>
	</c:if>
<%@include file="../includes/footer.jsp" %>