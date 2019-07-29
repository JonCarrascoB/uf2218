package com.ipartek.formacion.controller.backoffice;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.ipartek.formacion.controller.listener.UsuariosLogeadosListener;
import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Video;
import com.mysql.jdbc.MysqlDataTruncation;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

/**
 * Servlet implementation class crearVideo
 */
@WebServlet("/backoffice/crearVideo")
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
	public static final String OP_DETALLE = "4";
	public static final String OP_ELIMINAR = "5";
	
	private static VideoDAO videoDAO;
	private static HashMap<Integer,Video> videos;
	private Validator validator;
	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		videoDAO = VideoDAO.getInstance();
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
			case OP_DETALLE:
				detallar(request,response);
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

	private void detallar(HttpServletRequest request, HttpServletResponse response) {
		
		
			String sid = request.getParameter("id");
			int id = Integer.parseInt(sid);
		
		
			Video v = VideoDAO.getById(id);
			request.setAttribute("video", v );
			
			if(request.getSession().getAttribute("videos") == null) {
				videos = new HashMap<Integer,Video>();	
			}
			
			videos.put(v.getId(), v);
			request.getSession().setAttribute("videos", videos );
			view = VIEW_DETALLE;
		
		
	}


	private void guardar(HttpServletRequest request, HttpServletResponse response) {
		
		String sid = request.getParameter("id");
		String nombre = request.getParameter("nombre");
		String codigo = request.getParameter("codigo");
		
		
		Video v = new Video();
		v.setId(Integer.parseInt(sid));
		v.setNombre(nombre);
		v.setCodigo(codigo);
		
		Set<ConstraintViolation<Video>> violations = validator.validate(v);
		if (violations.isEmpty()) {
		
			try {
				if (v.getId() == -1) {
					videoDAO.crear(v);
				} else {
					videoDAO.modificar(v);
				}
				request.setAttribute("mensaje", new Alert("success", "El nuevo nombre ha sido guardado correctamente"));
			
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("mensaje", new Alert("danger", "Ha habido un problema, el codigo ya existe."));
			}
		} else {//hay violaciones de las validaciones
			
			String mensaje = "";
			for (ConstraintViolation<Video> violation : violations) {
				mensaje += violation.getPropertyPath()+": "+violation.getMessage()+"<br>";
			}
			request.setAttribute("mensaje", new Alert("warning", mensaje));
		}
		
		request.setAttribute("video", v );
		view = VIEW_FORM;
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
	
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		
		if (videoDAO.delete(id)) {
			request.setAttribute("mensaje", new Alert("succes", "El video ha sido eliminado correctamente"));
			listar(request,response);
		} else {
			request.setAttribute("mensaje", new Alert("danger", "Ha ocurrido un fallo en la eliminacion del video"));
			listar(request,response);
		}
	
	}
	
	private void crearNuevo(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("video", new Video());
		view = VIEW_FORM;
	}
	


}