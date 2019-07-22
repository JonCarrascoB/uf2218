<%@page import="com.ipartek.formacion.controller.YoutubeController"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Crear video</h1>
	
	<%@include file="../includes/mensaje.jsp"%>

	<form action="crearVideo" method="post">
		<div class="form-group">
    		<input type="hidden" class="form-control" name="op" value="<%=YoutubeController.OP_GUARDAR%>">
  		</div>
  		<div class="form-group">
    		<label for="id">ID</label>
    		<input type="text" class="form-control" name="id" id="id" value="${video.id}" readonly">
  		</div>
  		<div class="form-group">
    		<label for="nombre">Titulo</label>
    		<input type="text" class="form-control" name="nombre" id="nombre" value="${video.nombre}" 
    		placeholder="Minimo 2 letras maximo 150">
  		</div>
  		<div class="form-group">
    		<label for="codigo">Codigo:</label>
    		<input type="text" class="form-control" name="codigo" id="codigo" value="${video.codigo}" 
    		placeholder="Exactamente 11 caracteres">
  		</div>
  		<!-- <div class="form-group">
    		<label for="videoRep">Numero de repeticiones:</label>
    		<input type="number" class="form-control" name="videoRep" id="videoRep"  
    		value="1" step="1">
  		</div> -->
  		
  		<input type="submit" value="${(video.id != -1)? 'Modificar':'Crear'}">
  		<button type="reset" class="btn btn-danger">Eliminar datos</button>
	</form>
	
	<c:if test="${video.id != -1}">
		<!-- Button trigger modal -->
			<button type="button" class="btn btn-outline-danger btn-block" data-toggle="modal" data-target="#exampleModal">
				  Eliminar
			</button>
		
		<!-- Modal -->
	
		<div class="modal" tabindex="-1" role="dialog">
  			<div class="modal-dialog" role="document">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title">¿Estas seguro que deseas eliminar el video?</h5>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
        				</button>
      				</div>
      				<div class="modal-body">
        				<p>Esta operación no es reversible</p>
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        				<form action="videos" method="post">	
							<input type="hidden" name="op" value="<%=YoutubeController.OP_ELIMINAR%>">
							<input type="hidden" name="id" value="${video.id}" readonly>			
							<input type="submit" value="Eliminar">	
						</form>
      				</div>
    			</div>
  			</div>
		</div>
		
	</c:if>	
<%@include file="../includes/footer.jsp" %>