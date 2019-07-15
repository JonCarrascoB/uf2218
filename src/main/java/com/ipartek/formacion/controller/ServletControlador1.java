package com.ipartek.formacion.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletControlador1
 */
@WebServlet("/controlador1")
public class ServletControlador1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// obtener datos del cliente mediante la request
		
		
		response.setContentType("text/html");
		//dar una respuesta a traves de la respuesta
		PrintWriter out = response.getWriter();
		out.print("<h2>Respuesta desde ServletControlador1</h2>");
		out.print("<p>User-Agent <b>"+ request.getHeader("user-agent") +"</b></p>");
		
		
		//mirar version http
		
		//todos los datos de la cabecera
		Enumeration<String> head = request.getHeaderNames();
		out.print("<h2>Todos los parametros de la cabecera</h2>");
		out.print("<ul>");
		while(head.hasMoreElements()) {
			String headName = head.nextElement();
			String headValue = request.getHeader(headName);
			out.print("<li>"+ headName + "<b>" + headValue + "</b></li>");
			
		}
		out.print("</ul>");
		
		
		// todos los parametros que envie el usuario
		out.print("<h2>Parametros</h2>");
		out.print("<ul>");
			Enumeration<String> eParamas = request.getParameterNames();
			while ( eParamas.hasMoreElements() ) {				
				String paramName = eParamas.nextElement();
				String paramValue = request.getParameter(paramName);
				out.print("<li>" + paramName + " <b>"+ paramValue +"</b></li>");					
			 }			
		out.print("</ul>");
		
		//dar respuesta por parametros
		String p1 = request.getParameter("param1");
		String p2 = request.getParameter("param2");
		String p3 = request.getParameter("p3");
		out.print("<h2>Respuesta con parametros</h2>");
		out.print("<p> El primer parametro es "+ p1+ ", el segundo parametro es "+ p2+" y el ultimo parametro es "+p3);
		
		
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// tenemos el doGet y doPost puenteados, hacen lo mismo
		doGet(request, response);
	}

}
