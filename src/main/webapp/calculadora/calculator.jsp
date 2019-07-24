<%@page import="com.ipartek.formacion.controller.CalculatorController"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Iparlator, tu calculadora Web</h1>
	<%@include file="../includes/mensaje.jsp"%>
	
	<form action="calculator" method="post" class="mb-2">
		<div class="form-group">
    		<label for="num1">Inserte un numero:</label>
    		<input type="number" class="form-control" name="num1" id="num1" value="${num1}" step="0.01" >
  		</div>
		<div class="form-group">
    		<label for="num2">Inserte otro numero:</label>
    		<input type="number" class="form-control" name="num2" id="num2" value="${num2}" step="0.01">
  		</div>
  		<div class="form-group">
    		<label for="operaciones">Operaciones</label>
	  		<select class="form-control" name="op" id="operaciones">
	  			<option value="<%=CalculatorController.OP_SUMAR%>" ${(op == CalculatorController.OP_SUMAR)?'selected':''}>Sumar</option>
	  			<option value="<%=CalculatorController.OP_RESTAR%>"${(op == CalculatorController.OP_RESTAR)?'selected':''}>Restar</option>
	  			<option value="<%=CalculatorController.OP_MULTIPLICAR%>"${(op == CalculatorController.OP_MULTIPLICAR)?'selected':''}>Multiplicar</option>
	  			<option value="<%=CalculatorController.OP_DIVIDIR%>"${(op == CalculatorController.OP_DIVIDIR)?'selected':''}>Dividir</option>
			</select>
  		</div>
		<input type="submit" class="btn btn-primary" value="Calcular">
	</form>
	
	<div>
		<h4>El resultado es:</h4>
		${resultado}
	
	</div>

<%@include file="../includes/footer.jsp" %>