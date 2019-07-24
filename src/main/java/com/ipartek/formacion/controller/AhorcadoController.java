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
    
	private static final ArrayList<String> PALABRAS = new ArrayList<String>();

	
	
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
		}
		
		
		
		
		
		
		int numIntentos = 7;
		
		if (palabra == null) {
			
			Random rd = new Random();
			palabra = PALABRAS.get(rd.nextInt(PALABRAS.size()));
			
		request.getRequestDispatcher(VIEW_GAME).forward(request, response);
	}


	private void comprobar(HttpServletRequest request, HttpServletResponse response) {
		String palabra = request.getParameter("palabra");
		int tamano = 
		
	}


	private void insertarPalabra(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
}
