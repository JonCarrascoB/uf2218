package com.ipartek.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.controller.pojo.Alert;

/**
 * Servlet implementation class LoginOutController
 */
@WebServlet("/logout")
public class LoginOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String VIEW_BACKOFFICE = "backoffice/index.jsp";
	public static final String VIEW_LOGIN = "login.jsp";
	public static String view = VIEW_LOGIN;
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("usuario");
		session.invalidate();
		session = null;
		
		request.setAttribute("mensaje", new Alert("success","Gracias por Visitarnos") );			
		request.getRequestDispatcher(view).forward(request, response);
		
	}

}
