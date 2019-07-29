package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IdiomaController
 */
@WebServlet("/i18n")
public class IdiomaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Locale locale;
		String idiomaSeleccionado = request.getParameter("idiomaSeleccionado");
		String ruta = request.getParameter("ruta");
		ruta = ruta.split("uf2218/");
		String lenguage = "en";
		String country = "EN";
		
		if (idiomaSeleccionado != null) {
			lenguage = idiomaSeleccionado.split("_")[0];
			country = idiomaSeleccionado.split("_")[1];
		}
		
		
		locale = new Locale(lenguage, country);
		ResourceBundle properties = ResourceBundle.getBundle ( "i18n/i18nmessages", locale );
		
		//guardar en sesion el idioma selecionado para las jsps
		HttpSession session = request.getSession();
		session.setAttribute("locale", idiomaSeleccionado);
		
		if(ruta != null) {
			request.getRequestDispatcher(ruta).forward(request, response);
		} else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		request.setAttribute("mensajeInicio", properties.getString("menu.inicio"));
		
		
		//request.setAttribute("mensajeIdioma", "TODO terminar");
		
		request.getRequestDispatcher("ejemplos/i18n.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
