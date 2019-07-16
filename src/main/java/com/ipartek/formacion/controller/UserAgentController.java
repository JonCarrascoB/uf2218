package com.ipartek.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserAgentController
 */
@WebServlet("/useragent")
public class UserAgentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		String userAgent = request.getHeader("user-agent").toLowerCase();
		
		
		if(userAgent.contains("trident")) {
			request.setAttribute("navegador", "<i class=\"fab fa-internet-explorer\"></i> Internet Explorer");
		} else if (userAgent.contains("opr")) {
			request.setAttribute("navegador", "<i class=\"fab fa-opera\"></i> Opera");
		} else if (userAgent.contains("chrome")) {
			request.setAttribute("navegador", "<i class=\"fab fa-chrome\"></i> Google Chrome");
		} else if(userAgent.contains("firefox")) {
			request.setAttribute("navegador", "<i class=\"fab fa-firefox\"></i> Mozilla Firefox");
		}else {
			request.setAttribute("navegador", "Los otros navegadores no son compatibles con nuestra pagina: <i class=\"fab fa-safari\"></i>");
		}
		
		if(userAgent.contains("mobile")){
			request.setAttribute("movil","<i class=\"fas fa-mobile-alt\"></i> Estas usando un movil");
		} else {
			request.setAttribute("movil", "<i class=\"fas fa-desktop\"></i> No estas usando un movil");
		}
		request.getRequestDispatcher("ejemplos/basico2.jsp").forward(request, response);
		
	}
	//Internet explorer
	//"Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; InfoPath.3; rv:11.0) like Gecko"
	//Chrome
	//"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36"
	//Firefox
	//Firefox
	//



}
