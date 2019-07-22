package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Validation;
import javax.validation.Validator;

import com.ipartek.formacion.model.dao.UserDAO;
import com.ipartek.formacion.model.dao.VideoDAO;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	public static final String VIEW_FORM = "sigin.jsp";
	
	public static String view = VIEW_FORM;
	
	public static final String OP_LISTAR = "0";
	public static final String OP_NEWUSER = "1";
	public static final String OP_GUARDAR = "2";
	public static final String OP_MODIFICAR = "3";
	public static final String OP_DETALLE = "4";
	public static final String OP_ELIMINAR = "5";
	
	private static UserDAO userDAO;
	
	private Validator validator;
       
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		userDAO = UserDAO.getInstance();
		validator = Validation.buildDefaultValidatorFactory().getValidator();
	}

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

	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
