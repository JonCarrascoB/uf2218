<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% // Gestion del idioma %>
<c:set  var="locale" 
			value="${not empty sessionScope.locale ? sessionScope.locale : 'es_ES'}" 
			scope="session" />
			
	<fmt:setLocale value="${locale}" />
	<fmt:setBundle basename="i18n.i18nmessages" /> 

<% // Fin de la gestion del idioma %>

<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- <meta http-equiv="refresh" content="3"> -->
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <!-- Font-Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"/>
	<!-- <link rel="stylesheet" type="text/css" href="resources/vendors/fontawesome-free-5.9.0-web/css/all.min.css" />
	 -->
	<base href="${pageContext.request.contextPath}/">
	<!-- CSS propio -->
	<link rel="stylesheet" type="text/css" href="resources/css/styles.css" media="screen"/>
	
    <title>JEE</title>
  </head>
  
  <body>
  
  	