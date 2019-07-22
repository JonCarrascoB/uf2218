package com.ipartek.formacion.model.pojo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Usuario {
	
	public static final String VALIDATION = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$)$";
	
	//Atributos
	private int id;
	
	@NotNull
	@Size(min=3, max=45) // minimo 2 letras, max 150
	private String name;
	
	@NotNull
	@Size(min=8, max=8, message="Exactamente debe ser 8 caracteres")
	@Pattern(regexp = VALIDATION)
	private String password;
	

	// constructores
		public Usuario () {
			super();
			this.id = -1;
			this.name = "";
			this.password = "";
		}
		
		public Usuario(int id, String name, String password) throws Exception {
			this();
			this.setId(id);
			this.setName(name);
			this.setPassword(password);
		}

		// getters y setters
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}
		
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}


		// funciones
		@Override
		public String toString() {
			return "Usuario [id=" + id + ", usuario=" + name + ", contraseña=" + password + "]";
		}

}
