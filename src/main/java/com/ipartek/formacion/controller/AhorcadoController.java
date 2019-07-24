package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Validation;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.VideoDAO;

/**
 * Servlet implementation class AhorcadoController
 */
@WebServlet("/ahorcado")
public class AhorcadoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static final String VIEW_GAME = "ahorcado/ahorcado.jsp";
	
	public static final String OP_PALABRA = "0";
	public static final String OP_COMPROBAR = "1";
	public static final int VIDA_PERDIDA = 1;
    
	private static final ArrayList<String> PALABRAS = new ArrayList<String>();
	private static String palabra;
	private static char[] respuesta;
	private static Boolean[] respRep;
	private int vidas = 7;
	private int aciertos = 0;
	private int cont=0;
	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		PALABRAS.add("comodoro");
		PALABRAS.add("esdrujula");
		PALABRAS.add("catamaran");
		PALABRAS.add("abdomen");
		PALABRAS.add("brujula");
		PALABRAS.add("vencedor");
	}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProccess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProccess(request,response);
	}

	private void doProccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String option = request.getParameter("op");
		
		switch (option) {
		case OP_PALABRA:
			insertarPalabra(request,response);
			break;
		case OP_COMPROBAR:
			comprobar(request,response);
			break;
		default:
			break;
		}
			
		request.getRequestDispatcher(VIEW_GAME).forward(request, response);
	}


	private void comprobar(HttpServletRequest request, HttpServletResponse response) {
		int tamano = palabra.length();
	    do {
	    	String election = request.getParameter("letra").trim().toLowerCase();
		    if(election.isEmpty() ) {
				request.setAttribute("mensaje", new Alert("danger", "No has introducido una letra"));
			}else {
				char letra = election.charAt(0);
				if(palabra.contains(election)) {
					for (int i = 0; i < tamano; i++) {
						if (letra == palabra.toLowerCase().charAt(i) && respRep[i].equals(false)) {
							respuesta[i] = letra;
							respRep[i] = true;
							cont++;
						} 
								 
					}
					aciertos = aciertos + cont;
				} else {
					vidas = vidas - VIDA_PERDIDA;
				}
		        cont = 0;
		     
		        request.setAttribute("respuesta", respuesta);
		        request.setAttribute("aciertos", aciertos);
		        request.setAttribute("vidas", vidas);
			} 
		} while (vidas != 0 && aciertos == tamano);
	    
	    if(vidas == 0) {
	    	request.setAttribute("mensaje", new Alert("warning", "Mala suerte!!!, prueba a jugar otra vez"));
	    } else {
	    	request.setAttribute("mensaje", new Alert("success", "Enhorabuena, has ganado!!!!"));
	    }
	}

	private void insertarPalabra(HttpServletRequest request, HttpServletResponse response) {
		palabra = request.getParameter("palabra").trim().toLowerCase();
		
		if(palabra.isEmpty()) {
			request.setAttribute("mensaje", new Alert("danger", "No has introducido una palabra"));
		}else {
			int tamano = palabra.length();

			respuesta = new char[tamano];
			respRep = new Boolean[tamano];

			for (int i = 0; i < tamano; i++) {
				respuesta[i] = '_';
			}
			for (int i = 0; i < tamano; i++) {
				respRep[i] = false;
			}
			
			request.setAttribute("respuesta", respuesta);
			request.setAttribute("respRep", respRep);
		}
		
	}
}
