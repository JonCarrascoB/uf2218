<%@page import="com.ipartek.formacion.controller.YoutubeController"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Crear video</h1>
	<form action="crearVideo" method="post">
		<!-- <p style="color: red">${mensaje}</p> -->
		
		<div class="form-group">
    		<input type="hidden" class="form-control" name="op" value="<%=YoutubeController.OP_CAMBIAR%>" >
  		</div>
  		<div class="form-group">
    		<label for="id">ID</label>
    		<input type="text" class="form-control" name="nombre" id="id" value="${video.id}" readonly">
  		</div>
		
  		<div class="form-group">
    		<label for="nombre">Titulo</label>
    		<input type="text" class="form-control" name="nombre" id="nombre" value="${video.nombre}" placeholder="Minimo 2 letras maximo 150" required pattern=".{2,150}">
  		</div>
  		<div class="form-group">
    		<label for="codigo">Codigo:</label>
    		<input type="text" class="form-control" name="codigo" id="codigo" value="${video.codigo}" placeholder="Exactamente 11 caracteres" required pattern=".{11,11}">
  		</div>
  		<!-- <div class="form-group">
    		<label for="videoRep">Numero de repeticiones:</label>
    		<input type="number" class="form-control" name="videoRep" id="videoRep"  value="1" step="1">
  		</div> -->
  		
  		<input type="submit" value="${(video.id != -1)? 'Crear':'Modificar'}">
  		<button type="reset" class="btn btn-danger">Eliminar datos</button>
	</form>
	
	<c:if test="${video.id != -1}">
		<form action="videos" method="post">	
			<input type="hidden" name="op" value="<%=YoutubeController.OP_ELIMINAR%>">
			<input type="hidden" name="id" value="${video.id}" readonly>			
			<input type="submit" value="Eliminar">	
		</form>
	</c:if>	
<%@include file="../includes/footer.jsp" %>