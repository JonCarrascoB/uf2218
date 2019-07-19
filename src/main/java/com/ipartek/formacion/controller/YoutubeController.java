package com.ipartek.formacion.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Video;
import com.mysql.jdbc.MysqlDataTruncation;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

/**
 * Servlet implementation class crearVideo
 */
@WebServlet("/crearVideo")
public class YoutubeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	public static final String VIEW_INDEX = "youtube/index.jsp";
	public static final String VIEW_FORM = "youtube/formulario-youtube.jsp";
	public static final String VIEW_DETALLE = "youtube/detalle.jsp";
	public static String view = VIEW_INDEX;
	
	public static final String OP_LISTAR = "0";
	public static final String OP_CREARNUEVO = "1";
	public static final String OP_GUARDAR = "2";
	public static final String OP_MODIFICAR = "3";
	public static final String OP_CAMBIAR = "4";
	public static final String OP_ELIMINAR = "5";
	
	//private static ArrayList<Video> videos = new ArrayList<Video>();
	//private static ArrayList<Video> resultado;
	private static VideoDAO videoDAO;
	//private static Video video;

	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		videoDAO = VideoDAO.getInstance();
		
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
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String option = request.getParameter("op");
		
		if (option == null) {
			option = OP_LISTAR;
		}
		switch (option) {
			case OP_CREARNUEVO:
				crearNuevo(request,response);
				break;
			case OP_GUARDAR:
				guardar(request,response);
				break;
			case OP_MODIFICAR:
				modificar(request, response);
				break;
			case OP_CAMBIAR:
				cambiar(request, response);
				break;
			case OP_ELIMINAR:
				eliminar(request,response);
				break;
			default:
				listar(request,response);
				break;
		}
		
		
		// request interna o ir a una JSP
		request.getRequestDispatcher(view).forward(request, response);
		
	}

	private void cambiar(HttpServletRequest request, HttpServletResponse response) {
		
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String nombre = request.getParameter("nombre");
		String codigo = request.getParameter("codigo");
		
		//TODO llamar al Dao
		// si id == -1 Insert
		// si id >= 0 update
		
		Video v = new Video();
		
		request.setAttribute("video", v);
		
	}


	private void guardar(HttpServletRequest request, HttpServletResponse response) {
		
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String nombre = request.getParameter("nombre");
		String codigo = request.getParameter("codigo");
		
		Video v = new Video();
		v.setId(id);
		v.setNombre(nombre);
		v.setCodigo(codigo);
		
		try {
			videoDAO.save(v);
			listar(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	private void listar(HttpServletRequest request, HttpServletResponse response) {
	
		request.setAttribute("videos", videoDAO.getAll() );
		view = VIEW_INDEX;

	}


	private void modificar(HttpServletRequest request, HttpServletResponse response) {
		
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		
		Video v = VideoDAO.getById(id);
		request.setAttribute("video", v );
		view = VIEW_FORM;
		
	
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	
	}
	
	private void crearNuevo(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("video", new Video());
		view = VIEW_FORM;
	}
	


}