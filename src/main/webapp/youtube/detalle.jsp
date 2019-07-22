<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
	
	<h1>${video.nombre}</h1>
	<iframe class="video" src="https://www.youtube.com/embed/${video.codigo}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	<p><b>${video.nombre}</b> se ha reproducido ${video.reproduciones} veces.</p>


<%@include file="../includes/footer.jsp" %>