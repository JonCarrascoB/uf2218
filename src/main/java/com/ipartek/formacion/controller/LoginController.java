package com.ipartek.formacion.controller;

import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.controller.pojo.Alert;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String VIEW_BACKOFFICE = "backoffice/crearVideo";
	public static final String VIEW_LOGIN = "login.jsp";
	

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
		
		String usuario = request.getParameter("nombre");
		String password = request.getParameter("contraseña");
		
		if("admin".equals(usuario) && "admin".contentEquals(password)) {
			HttpSession session = request.getSession();
			//session.setMaxInactiveInterval(60*5); //5 min
			
			session.setAttribute("usuario", "usuario"+ request.getRemoteAddr());
			request.setAttribute("mensaje", new Alert("success", "Bienvenido " + usuario));
			
			String callback = (String) session.getAttribute("callback");
			
			if (callback == null) {
				request.getRequestDispatcher(VIEW_BACKOFFICE).forward(request, response);
			} else {
				session.removeAttribute("callback");
				response.sendRedirect(callback);
			}	
		} else {
			request.setAttribute("mensaje", new Alert("danger", "Credenciales no correctas"));
			request.getRequestDispatcher(VIEW_LOGIN).forward(request, response);
		}
		
		
	}
	
	//session.setAttribute("mensaje", new Alert("warning", "Las credenciales han caducado"));

}
