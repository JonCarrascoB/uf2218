package com.ipartek.formacion.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ipartek.formacion.model.ConnectionManager;
import com.ipartek.formacion.model.pojo.Usuario;
import com.ipartek.formacion.model.pojo.Video;
import com.mysql.jdbc.MysqlDataTruncation;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

public class UserDAO {
	
	private static UserDAO INSTANCE = null;
	
	private UserDAO() {
		super();
	}
	
	public static UserDAO getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new UserDAO();
		}
		return INSTANCE;
	}

	public ArrayList<Usuario> getAll() {
		
		ArrayList<Usuario> lista = new ArrayList<Usuario>();
		String sql = "SELECT userId, userName, userPass FROM usuarios ORDER BY userId DESC LIMIT 500";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery()) {

			while (rs.next()) {
				lista.add(mapper(rs));
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return lista;
	}

	public static Usuario getById(int id) {
		Usuario usuario = new Usuario();
		String sql = "SELECT userId, userName, userPass FROM usuarios WHERE id = ?;";
		try (Connection con = ConnectionManager.getConnection(); 
			 PreparedStatement pst = con.prepareStatement(sql)) {

			//sustituye el primer ? por la variable id
			pst.setInt(1, id);
			try (ResultSet rs = pst.executeQuery()) {
				if (rs.next()) {
					usuario = mapper(rs);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return usuario;
	}
	
	/*
	public ArrayList<Video> getByName(String search) {
		ArrayList<Video> lista = new ArrayList<Video>();
		String sql = "SELECT id, nombre FROM video WHERE nombre LIKE ? ORDER BY id DESC LIMIT 500;";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, "%" + search + "%");
			try (ResultSet rs = pst.executeQuery()) {
				while (rs.next()) {
					lista.add(mapper(rs));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	
	public boolean save(Video video) throws SQLException {
		boolean resultado = false;
		if (video != null) {
			// Sanitize nombre
			video.setNombre(video.getNombre());
			if (video.getId() == -1) {
				resultado = crear(video);
			} else {
				resultado = modificar(video);
			}
		}
		return resultado;
	}
	
	*/
	
	public boolean modificar(Usuario usuario) throws Exception {
		boolean resultado = false;
		String sql = "UPDATE usuarios SET userName= ?, userPass= ? WHERE  id = ?;";
		try (Connection con = ConnectionManager.getConnection(); 
			 PreparedStatement pst = con.prepareStatement(sql)) {
			
			pst.setString(1, usuario.getName());
			pst.setString(2, usuario.getPassword());
			pst.setInt(3, usuario.getId());
			
			int affectedRows = pst.executeUpdate(); //esto siempre cuando se hacen insert, delete o update
			if (affectedRows == 1) {
				resultado = true;
			}
		}
		return resultado;
	}
	
	public boolean crear(Usuario usuario) throws Exception {
		boolean resultado = false;
		String sql = "INSERT INTO usuarios (userName, userPass) VALUES (?, ?);";
		try (Connection con = ConnectionManager.getConnection(); 
			 PreparedStatement pst = con.prepareStatement(sql)) {
			
			pst.setString(1, usuario.getName());
			pst.setString(2, usuario.getPassword());
			
			int affectedRows = pst.executeUpdate(); //esto siempre cuando se hacen insert, delete o update
			if (affectedRows == 1) {
				resultado = true;
			}
		}
		return resultado;
	}
	
	/*
	private boolean doSave(PreparedStatement pst, Video video)
			throws MySQLIntegrityConstraintViolationException, MysqlDataTruncation {
		boolean resultado = false;
		try {
			int affectedRows = pst.executeUpdate();
			if (affectedRows == 1) {
				try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
					if (generatedKeys.next()) {
						video.setId(generatedKeys.getInt(1));
					}
				}
				resultado = true;
			}
		} catch (MySQLIntegrityConstraintViolationException e) {
			System.out.println("Video duplicado");
			throw e;
		} catch (MysqlDataTruncation e) {
			System.out.println("Nombre muy largo");
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	*/
	
	public boolean delete(int id) {
		boolean resultado = false;
		String sql = "DELETE FROM usuarios WHERE  id= ?;";
		try (Connection con = ConnectionManager.getConnection();
			 PreparedStatement pst = con.prepareStatement(sql);) {
			
			pst.setInt(1, id);
			int affetedRows = pst.executeUpdate();
			if (affetedRows == 1) {
				resultado = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	public static Usuario mapper(ResultSet rs) throws SQLException {
		Usuario u = new Usuario();
		u.setId(rs.getInt("userId"));
		u.setName(rs.getString("userName"));
		u.setPassword(rs.getString("userPass"));
		return u;
	}

	
	
}


