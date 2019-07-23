<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
<%@page import="java.util.*" session="true"%> <!-- se introduce para poder usar session en la jsp directamente -->
	<h1>Session</h1>
	
	<p>La session (HttpSession) sirve para almacenar información entre diferentes peticiones HTTP  ya que este protocolo es stateless (sin estado). Así pues en muchas ocasiones nos encontraremos con el problema de compartir estado (datos usuario) entre un conjunto amplio de páginas de nuestra Aplicación.</p>
	<p>Tiene una estructura de HashMap y permite almacenar cualquier tipo de objeto en ella de tal forma que pueda ser compartido por las diferentes páginas que como usuarios utilizamos.</p>
	<p>El funcionamiento del sistema de sessiones es relativamente sencillo. Cada vez que un usuario crea una session accediendo a una página (que la genere) se crea un objeto a nivel de Servidor con un HashMap vacío que nos permite almacenar la información que necesitamos relativa a este usuario. Realizado este primer paso se envía al navegador del usuario una Cookie que sirve para identificarle y asociarle el HashMap que se acaba de construir para que pueda almacenar información en él. Este HashMap puede ser accedido desde cualquier otra página permitiéndonos compartir información.</p>
	
	<h3>Ejemplos</h3>
	
	<h4>Obtenemos el identificador de la sesion</h4>
	<p>Primero añadimos al inicio de la JSP <code>&lt;%@page session="true" %&gt;</code> para poder usar la variable Session en la jsp directamente<p>
	<p>El codigo introducido es: <code>&lt;%HttpSession sesion=request.getSession(); 
		out.println(sesion.getId()); %&gt;</code></p>
	<p>La id de la sesion, que es un identificador unico, es:  
		<%HttpSession sesion=request.getSession(); 
		out.println(sesion.getId()); %>
	</p>
	<h4>Obtenemos la date de creacion de la session</h4>
	<p>El codigo introducido es: <code>&lt;% HttpSession sesion2=request.getSession(); 
		   Date momento = new Date(sesion2.getCreationTime()); 
		   out.println(momento); 
		   %&gt;</code></p>
	<p>El momento de la creacion de la pagina, es:  
		<% HttpSession sesion2=request.getSession(); 
		   Date momento = new Date(sesion2.getCreationTime()); 
		   out.println(momento); %>
	</p>
<%@include file="../includes/footer.jsp" %>