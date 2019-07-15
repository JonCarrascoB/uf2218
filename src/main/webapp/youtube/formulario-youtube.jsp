<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Crear video</h1>
	<form>
  		<div class="form-group">
    		<label for="videoId">Inserte la id:</label>
    		<input type="number" class="form-control" id="videoId"  value="1" step="1">
  		</div>
  		<div class="form-group">
    		<label for="titulo">Titulo</label>
    		<input type="text" class="form-control" id="titulo" placeholder="Minimo 2 letras maximo 150" required pattern=".{2,150}">
  		</div>
  		<div class="form-group">
    		<label for="codigo">Codigo:</label>
    		<input type="text" class="form-control" id="codigo"  placeholder="Exactamente 11 caracteres" required pattern=".{11,11}">
  		</div>
  		<div class="form-group">
    		<label for="videoRep">Numero de repeticiones:</label>
    		<input type="number" class="form-control" id="videoRep"  value="1" step="1">
  		</div>
  		<button type="submit" class="btn btn-success">Guardar video</button>
  		<button type="reset" class="btn btn-danger">Eliminar datos</button>
	</form>

<%@include file="../includes/footer.jsp" %>