package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.controller.pojo.Alert;

/**
 * Servlet implementation class CicloVidaController
 */
@WebServlet("/ciclovida")
public class CicloVidaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ArrayList<String> perros;
	private static ArrayList<String> resultado;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		perros = new ArrayList<String>();
		perros.add("Bubba");
		perros.add("Pulgas");
		perros.add("Logan");
		perros.add("Ares");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.service(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dogSearch = request.getParameter("buscar");
		
		if ( dogSearch != null && !dogSearch.trim().isEmpty() ) {
			
			for (String perro : perros) {			
				if ( perro.toLowerCase().contains(dogSearch.toLowerCase())) {
					resultado.add(perro);
				}
			}	
			request.setAttribute("perros", resultado );
		}else {
			request.setAttribute("perros", perros);	
		}
		
		request.setAttribute("mensaje", "");
		request.setAttribute("buscar", dogSearch);
		
		request.getRequestDispatcher("ejemplos/cicloVida.jsp").forward(request, response);
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
				perros.add(name);
				mensaje = new Alert("success", "El nuevo nombre ha sido guardado correctamente");
			}	
		}
		request.setAttribute("mensaje", mensaje);
		request.setAttribute("perros", perros);
		
		request.getRequestDispatcher("ejemplos/cicloVida.jsp").forward(request, response);
	}

}
