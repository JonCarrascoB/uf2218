package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.pojo.Youtube;

/**
 * Servlet implementation class NombresController
 */
@WebServlet("/nombres")
public class NombresController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ArrayList<String> nombres;
	private static ArrayList<String> resultado;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NombresController() {
		super();
		nombres = new ArrayList<String>();
		nombres.add("Manolo");
		nombres.add("Pepito");
		nombres.add("Ursiciano");
		nombres.add("Agapito");
	}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nameSearch = request.getParameter("buscar");
		
		if ( nameSearch != null && !nameSearch.trim().isEmpty() ) {
			
			for (String nombre : nombres) {			
				if ( nombre.toLowerCase().contains(nameSearch.toLowerCase())) {
					resultado.add(nombre);
				}
			}	
			request.setAttribute("nombres", resultado );
		}else {
			request.setAttribute("nombres", nombres);	
		}
		
		request.setAttribute("mensaje", "");
		request.setAttribute("buscar", nameSearch);
		
		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("nombre");
		Alert mensaje = new Alert("danger", "nombre no valido");
		if(name != null) {
			name = name.trim();
			if("".equalsIgnoreCase(name)) {
				mensaje = new Alert("warning", "Por favor Escribe un nombre valido");
			} else {
				nombres.add(name);
				mensaje = new Alert("success", "El nuevo nombre ha sido guardado correctamente");
			}	
		}
		request.setAttribute("mensaje", mensaje);
		request.setAttribute("nombres", nombres);
		
		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
	}

}
