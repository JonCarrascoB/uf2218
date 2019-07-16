package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.model.pojo.Youtube;

/**
 * Servlet implementation class NombresController
 */
@WebServlet("/nombres")
public class NombresController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ArrayList<String> nombres;
	
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getParameter("buscar") == null) {
			rellenarArray();
			request.setAttribute("nombres", nombres);
		} else {
			String nameSearch = request.getParameter("buscar");
			rellenarArray();
			for(String n : nombres ) {
				if(nameSearch.equals(n)) {
					request.setAttribute("nombreBuscado", nameSearch);
				} else {
					request.setAttribute("nombreBuscado", "Esta persona no pertenece a la lista");
				}
			}
			
		}
		
		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
	}

	private void rellenarArray() {
		nombres = new ArrayList<String>();
		nombres.add("Manolo");
		nombres.add("Pepito");
		nombres.add("Ursiciano");
		nombres.add("Agapito");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("nombre");
		nombres.add(name);
		request.setAttribute("nombres", nombres);

		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
	}

}
