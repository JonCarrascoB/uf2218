<%@page import="com.ipartek.formacion.controller.backoffice.YoutubeController"%>
<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/navbar.jsp" %>
	
	<h1>${video.nombre}</h1>
	<div class="row">
		<div class="col-8">
			<iframe class="video" src="https://www.youtube.com/embed/${video.codigo}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			<p><b>${video.nombre}</b> se ha reproducido ${video.reproduciones} veces.</p>
		</div>
		<div class="col-2 offset-2 pl-2">
			<h3>Ultimos Videos Observados</h3>
			<ul>
				<c:forEach items="${videos}" var="v">
					<li class="pb-2"><a href="backoffice/crearVideo?op=<%=YoutubeController.OP_DETALLE%>&id=${v.value.id}"><img class="rounded" alt="${v.value.nombre}" src="https://img.youtube.com/vi/${v.value.codigo}/default.jpg"></a>${v.value.nombre}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	


<%@include file="../../includes/footer.jsp" %>