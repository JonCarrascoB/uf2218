package com.ipartek.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.controller.pojo.Alert;

/**
 * Servlet implementation class CalculatorController
 */
@WebServlet("/calculator")
public class CalculatorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String VIEW_CALCULATOR = "calculadora/calculator.jsp";
	
	
	public static final String OP_SUMAR = "0";
	public static final String OP_RESTAR = "1";
	public static final String OP_MULTIPLICAR = "2";
	public static final String OP_DIVIDIR = "3";
	
	private static float resultado;
	private static float num1 = 0.00F;
	private static float num2 = 0.00F;

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
		
		String option = request.getParameter("op");
		switch (option) {
			case OP_SUMAR:
				sumar(request,response);
				break;
			case OP_RESTAR:
				restar(request,response);
				break;
			case OP_MULTIPLICAR:
				multiplicar(request, response);
				break;
			case OP_DIVIDIR:
				dividir(request,response);
				break;
			default:
				break;
		}
		
		request.setAttribute("op", option);
		// request interna o ir a una JSP
		request.getRequestDispatcher(VIEW_CALCULATOR).forward(request, response);
		
	}

	private void dividir(HttpServletRequest request, HttpServletResponse response) {
		
		String dato1 = request.getParameter("num1");
		String dato2 = request.getParameter("num2");
		
		try {
			num1 = Float.parseFloat(dato1);
			num2 = Float.parseFloat(dato2);
			if (num2 != 0) {
				resultado = num1 / num2;
			} else {
				request.setAttribute("mensaje", new Alert("danger", "no se puede dividir entre 0"));
			}
			
		} catch (Exception e) {
			resultado = 0.00F;
			request.setAttribute("mensaje", new Alert("danger", "Solo se pueden introducir numeros"));
		} finally {
			request.setAttribute("resultado", resultado);
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
		}

		
	}

	private void multiplicar(HttpServletRequest request, HttpServletResponse response) {
		String dato1 = request.getParameter("num1");
		String dato2 = request.getParameter("num2");
		
		try {
			num1 = Float.parseFloat(dato1);
			num2 = Float.parseFloat(dato2);
			resultado = num1 * num2;
		} catch (Exception e) {
			resultado = 0.00F;
			request.setAttribute("mensaje", new Alert("danger", "Solo se pueden introducir numeros"));
		}finally {
			request.setAttribute("resultado", resultado);
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
		}
		
	}

	private void restar(HttpServletRequest request, HttpServletResponse response) {
		String dato1 = request.getParameter("num1");
		String dato2 = request.getParameter("num2");
		
		try {
			num1 = Float.parseFloat(dato1);
			num2 = Float.parseFloat(dato2);
			resultado = num1 - num2;
		} catch (Exception e) {
			resultado = 0.00F;
			request.setAttribute("mensaje", new Alert("danger", "Solo se pueden introducir numeros"));
		}finally {
			request.setAttribute("resultado", resultado);
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
		}
		
	}

	private void sumar(HttpServletRequest request, HttpServletResponse response) {
		String dato1 = request.getParameter("num1");
		String dato2 = request.getParameter("num2");
		
		try {
			num1 = Float.parseFloat(dato1);
			num2 = Float.parseFloat(dato2);
			resultado = num1 + num2;
		} catch (Exception e) {
			resultado = 0.00F;
			request.setAttribute("mensaje", new Alert("danger", "Solo se pueden introducir numeros"));
		}finally {
			request.setAttribute("resultado", resultado);
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
		}
	}

}
