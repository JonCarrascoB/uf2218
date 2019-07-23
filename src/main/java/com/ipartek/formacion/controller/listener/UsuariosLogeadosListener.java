package com.ipartek.formacion.controller.listener;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.ipartek.formacion.model.pojo.Video;

/**
 * Application Lifecycle Listener implementation class UsuariosLogeadosListener
 *
 */
@WebListener
public class UsuariosLogeadosListener implements HttpSessionAttributeListener, HttpSessionListener {

	
	public static String nombre = "Esto es una variable";
	public static ArrayList<String> usuarios = new ArrayList<String>();
	
	
    /**
     * Default constructor. 
     */
    public UsuariosLogeadosListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // session creada
    	
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent event)  {
    	
    	if("usuario".equalsIgnoreCase(event.getName())) {
    		String usuario = event.getSession().getAttribute("usuario").toString();
        	usuarios.add(usuario);
    	}
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent event)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent event)  { 
         // TODO Auto-generated method stub
    }
	
}
