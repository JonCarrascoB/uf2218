package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Video;

/**
 * Servlet implementation class crearVideo
 */
@WebServlet("/crearVideo")
public class YoutubeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ArrayList<Video> videos = new ArrayList<Video>();
	private static ArrayList<Video> resultado;
	private static VideoDAO videoDAO;
	private static Video video;
       
	private static final String VIEW_RESPUESTA = "/youtube/index.jsp";
	private static final String VIEW_INDEX = "/youtube/formulario-youtube.jsp";
	private static String view = VIEW_RESPUESTA;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
		
		/*String videoSearch = request.getParameter("buscar");
		
		if(videoSearch == null) {
			String id = request.getParameter("Id");
			for (int i = 0; i < videos.size(); i++) {
				if(id.equals(videos.get(i).getId())) {
					videos.remove(videos.get(i));
				}
			}
			request.setAttribute("mensaje", "El video "+ id +" ha sido eliminado");
			
			VideoDAO videoDAO = VideoDAO.getInstance(); 
			request.setAttribute("videos", videoDAO.getAll() );
			
		} else {
			resultado = new ArrayList<Video>();
			for(int i=0; i<videos.size(); i++) {
				if(videos.get(i).equals(videoSearch)) {
					resultado.add(videos.get(i));
				} 
			}
			request.setAttribute("videos", resultado);
			
			String id = request.getParameter("videoId");
			for (int i = 0; i < videos.size(); i++) {
				if(id.equals(videos.get(i).getId())) {
					videos.remove(videos.get(i));
				}
			}
			
			request.setAttribute("mensaje", "El video "+ id +" ha sido eliminado");
			request.setAttribute("videos", videos);
		}
		
		
		// request interna o ir a una JSP
		request.getRequestDispatcher(view).forward(request, response);
	*/

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
		
		
		/*
		String id = request.getParameter("videoId");
		String titulo = request.getParameter("titulo");
		String codigo = request.getParameter("codigo");
		String rep = request.getParameter("videoRep");
		String mensaje = "Introduzca algun valor";
		
		try {
			Video video = new Video();
			
			video.setReproduciones(Integer.parseInt(rep));
			video.setNombre(titulo);
			video.setCodigo(codigo);
			request.setAttribute("video", video);
			videos.add(video);
			request.setAttribute("videos", videos);
			view = VIEW_RESPUESTA;
		} catch (Exception e) {
			view = VIEW_INDEX;
			request.setAttribute("mensaje", e.getMessage());
		}
		
		// request interna o ir a una JSP
		request.getRequestDispatcher(view).forward(request, response);
	}
	*/

}
	
private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String option = request.getParameter("op");
		String id = request.getParameter("id");
		int realId = Integer.parseInt(id);
		
		switch (option) {
			case "1":
				listar();
				request.setAttribute("videos", videoDAO.getAll() );
				request.getRequestDispatcher(view).forward(request, response);
				break;
			case "2":
				crearNuevo();
				break;
			case "3":
				modificar(realId);
				request.setAttribute("video", video);
				request.getRequestDispatcher(VIEW_INDEX).forward(request, response);
				break;
			case "4":
				eliminar();
				break;
		}
		
		
		// request interna o ir a una JSP
		
		
	}

	private void eliminar() {
	// TODO Auto-generated method stub
	
	}
	private void modificar(int id) {
		
		video = VideoDAO.getById(id);
	
	}
	private void crearNuevo() {
		
		/*String titulo = request.getParameter("titulo");
		String codigo = request.getParameter("codigo");
		String rep = request.getParameter("videoRep");*/
	
	}
	private void listar() {
	
		VideoDAO videoDAO = VideoDAO.getInstance();
	
	}


}