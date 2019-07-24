<%@page import="com.ipartek.formacion.controller.AhorcadoController"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Ahorcado</h1>
	<%@include file="../includes/mensaje.jsp"%>
	
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
			<%
			String lives = (String) request.getAttribute("vidas");
			int live = Integer.parseInt(lives);
			switch (live) {
			case 7:
				%><img alt="7 vidas aun" src="resources/images/ahorcadoImg/7v.png"><% 
				break;
			case 6:
				%><img alt="6 vidas aun" src="resources/images/ahorcadoImg/6v.png"><% 
				break;
			case 5:
				%><img alt="5 vidas aun" src="resources/images/ahorcadoImg/5v.png"><% 
				break;
			case 4:
				%><img alt="4 vidas aun" src="resources/images/ahorcadoImg/4v.png"><% 
				break;
			case 3:
				%><img alt="3 vidas aun" src="resources/images/ahorcadoImg/3v.png"><% 
				break;
			case 2:
				%><img alt="2 vidas aun" src="resources/images/ahorcadoImg/2v.png"><% 
				break;
			case 1:
				%><img alt="solo 1 vida" src="resources/images/ahorcadoImg/1v.png"><% 
				break;
			case 0:
				%><img alt="muerto" src="resources/images/ahorcadoImg/0v.png"><% 
				break;
			}%>
		</div>
	</div>
<%@include file="../includes/footer.jsp" %>