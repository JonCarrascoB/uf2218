<%@page import="com.ipartek.formacion.model.pojo.Youtube" %>
<%@page import="java.util.ArrayList" %>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>Listado de Videos</h1>
	<table class="table">
  		<thead>
    		<tr>
      			<th scope="col">ID</th>
      			<th scope="col">Titulo</th>
      			<th scope="col">Codigo</th>
      			<th scope="col">Numero de reproduciones</th>
      			<th scope="col">Detalle</th>
      			<th scope="col"></th>
    		</tr>
  		</thead>
  		<tbody>
    		<tr>
      			<th scope="row">1</th>
      			<td>Travis - Idlewild</td>
      			<td>WLKBOJ9jyQg</td>
      			<td>4</td>
      			<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      			<td><a class="btn btn-danger btn-block mb-2" href="crearVideo">Eliminar</a></td>
    		</tr>
   			 <tr>
      			<th scope="row">2</th>
      			<td>AC/DC - Highway to Hell</td>
      			<td>gEPmA3USJdI</td>
      			<td>2</td>
      			<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      			<td><a class="btn btn-danger btn-block mb-2" href="crearVideo">Eliminar</a></td>
    		</tr>
    		<tr>
      			<th scope="row">3</th>
      			<td>MUSE - Uprising</td>
      			<td>w8KQmps-Sog</td>
      			<td>1</td>
      			<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      			<td><a class="btn btn-danger btn-block mb-2" href="crearVideo">Eliminar</a></td>
    		</tr>
    		<tr>
      			<th scope="row">4</th>
      			<td>Editors - Racin Rats</td>
      			<td>-KTqnCBelPE</td>
      			<td>1</td>
      			<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      			<td><a class="btn btn-danger btn-block mb-2" href="crearVideo">Eliminar</a></td>
    		</tr>
    		<tr>
      			<th scope="row">5</th>
      			<td>Future Islands - Cave</td>
      			<td>RGrhubD8VDg</td>
      			<td>32</td>
      			<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      			<td><a class="btn btn-danger btn-block mb-2" href="crearVideo">Eliminar</a></td>
    		</tr>
    		<tr>
      			<th scope="row">6</th>
      			<td>Loquillo - Cadillac Solitario</td>
      			<td>4sWCu-LA4dw</td>
      			<td>1</td>
      			<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      			<td><a class="btn btn-danger btn-block mb-2" href="crearVideo">Eliminar</a></td>
    		</tr>
    		<% ArrayList<Youtube> listVideo = (ArrayList<Youtube>) request.getAttribute("videos");
				for(Youtube v : listVideo){
				%>
				<tr>
					<th scope="row"><%=v.getId() %></th>
					<td><%=v.getTitulo()%></td>
					<td><%=v.getCodigo()%></td>
					<td><%=v.getReproduciones()%></td>
					<td><a class="btn btn-success btn-block mb-2" href="youtube/detalle.jsp">Detalles</a></td>
      				<td><a class="btn btn-danger btn-block mb-2" href="crearVideo">Eliminar</a></td>
				</tr>
				<%}%>
  		</tbody>
	</table>

<%@include file="../includes/footer.jsp" %>