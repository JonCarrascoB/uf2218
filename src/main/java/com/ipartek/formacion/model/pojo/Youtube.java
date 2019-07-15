package com.ipartek.formacion.model.pojo;

public class Youtube {
	
	public static final int LONGITUD_CODIGO = 11;
	public static final int LONGITUD_MIN_TITULO = 2;
	public static final int LONGITUD_MAX_TITULO = 150;
	public static final String URL = "Https://www.youtube.com/watch?v=";
	
	//Atributos
	private int id;
	private String titulo;  // minimo 2 letras, max 150
	private String codigo;  // exactamente 11
	private int reproduciones;

	// constructores

		public Youtube(int id, String titulo, String codigo) throws Exception {
			super();
			this.setId(id);
			this.setTitulo(titulo);
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
		
		
		public String getTitulo() {
			return titulo;
		}

		public void setTitulo(String titulo) throws Exception {

			if (titulo != null && titulo.length() >= LONGITUD_MIN_TITULO && titulo.length() <= LONGITUD_MAX_TITULO) {
				this.titulo = titulo;
			} else {
				String msg = String.format("Titulo debe ser entre "+LONGITUD_MIN_TITULO+" y "+LONGITUD_MAX_TITULO);
				throw new Exception(msg);
			}

		}

		public String getCodigo() {
			return codigo;
		}

		public void setCodigo(String codigo) throws Exception {

			if (codigo != null && codigo.length() == LONGITUD_CODIGO) {

				this.codigo = codigo;
			} else {
				throw new Exception("Longitud de codigo debe ser " + LONGITUD_CODIGO);
			}
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
			return "Youtube [id=" + id + ", titulo=" + titulo + ", codigo=" + codigo + ", reproduciones=" + reproduciones + "]";
		}

		public String getUrl() {
			return URL + codigo;
		}
}
