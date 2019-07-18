package com.ipartek.formacion.model.pojo;

public class Video {
	
	public static final int LONGITUD_CODIGO = 11;
	public static final int LONGITUD_MIN_TITULO = 2;
	public static final int LONGITUD_MAX_TITULO = 150;
	public static final String URL = "Https://www.youtube.com/watch?v=";
	
	//Atributos
	private int id;
	private String nombre;  // minimo 2 letras, max 150
	private String codigo;  // exactamente 11
	private int reproduciones;

	// constructores
		public Video () {
			super();
		}
		
		public Video(int id, String nombre, String codigo) throws Exception {
			this();
			this.setId(id);
			this.setNombre(nombre);
			this.setCodigo(codigo);
			this.reproduciones = 0;
		}

		// getters y setters
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}
		
		
		public String getNombre() {
			return nombre;
		}

		public void setNombre(String nombre) {
			this.nombre = nombre;
		}

		public String getCodigo() {
			return codigo;
		}

		public void setCodigo(String codigo) {
			this.codigo = codigo;
		}

		public int getReproduciones() {
			return reproduciones;
		}

		public void setReproduciones(int reproduciones) {
			this.reproduciones = reproduciones;
		}

		// funciones
		@Override
		public String toString() {
			return "Youtube [id=" + id + ", titulo=" + nombre + ", codigo=" + codigo + ", reproduciones=" + reproduciones + "]";
		}

		public String getUrl() {
			return URL + codigo;
		}
}
