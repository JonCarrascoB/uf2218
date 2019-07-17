<%@page import="java.util.ArrayList"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>

	<h1>JSP - Java Server Pages</h1>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Directivas</h2>
		<p>Son etiquetas a partir de las cuales se genera informaci�n que puede ser utilizada por el motor de JSP. No producen una salida visible al usuario sino que configura c�mo se ejecutar� la p�gina JSP.</p>
		<p>Se escriben de la siquiente forma: <code>&lt;%@ ... %&gt;</code></p>
		<p>Son de tres tipos:</p>
		<ol>
			<li>
				<h3>Include</h3>
				<p>Incluye el contenido de un fichero en la p�gina mediante el atributo file</p>
				<p>Introducimos en esta pagina el header mediante el codigo <code>&lt;%@include file="../includes/header.jsp" %&gt;</code></p>
			</li>
			<li>
				<h3>Taglib</h3>
				<p>Importa bibliotecas de etiquetas (Tag Libraries)</p>
				<p>Vease el ejercicio "jstl.jsp"</p>
			</li>
			<li>
				<h3>Page</h3>
				<p>Especifica atributos relacionados con la p�gina a procesar. Los atributos son: import, sessio, contentType, buffer, errorPage, isErrorPage </p>
				<p>Introducimos pojos o Jar mediante este metodo, p.e.: <code>&lt;%@page import="java.util.ArrayList" %&gt;</code></p>
			</li>
		</ol>
	</section>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Declaraciones</h2>
		<p>Nos permiten declarar variables, funciones y datos est�ticos. Se introduce mediante: <code>&lt;%! ... %&gt;</code></p>
		
		<%! String alumnoNew = "Ander"; %>
		<% ArrayList <String> lista = (ArrayList <String>)request.getAttribute("clase");
		lista.add(alumnoNew);%>
		<ul class="list-group">
			<%
			for(String alumno: lista){
				%><li class="list-group-item"><%=alumno %></li><%
			}%>
		
		</ul>
	</section>
	
	<section class="p-3 mb-3 bg-light shadow">
		<h2>Scriptlets y Expresiones</h2>
		<p>Los primeros son partes de c�digo Java incrustadas entre los elementos est�ticos de la p�gina. Se introducen mediante: <code>&lt;% ... %&gt;</code></p>
		<p>Las expresiones se eval�an dentro de la servlet. No deben acabar en ";". Se introduce mediante: <code>&lt;%= ... %&gt;</code></p>
		
		<ul class="list-group">
			<%ArrayList <String> lista2 = (ArrayList <String>) request.getAttribute("clase");
			for(String alumno: lista2){
				%><li class="list-group-item"><%=alumno %></li><%
			}%>
		
		</ul>
	
	</section>

<%@include file="../includes/footer.jsp" %>