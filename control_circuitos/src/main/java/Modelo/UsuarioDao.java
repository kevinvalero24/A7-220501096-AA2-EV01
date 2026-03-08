/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author kevin
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioDao {

    // Variables globales
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    // Metodo para listar todos los usuarios
    public ArrayList<Usuario> ListarUsuarios() {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        try {
            conn = ConexionDao.ObtenerConexion();
            String sql = "SELECT * FROM usuarios";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Usuario usr = new Usuario();
                // Nombres de columnas actualizados según DBeaver
                usr.setId(rs.getInt("id"));
                usr.setNombre(rs.getString("nombre"));
                usr.setCorreo(rs.getString("correo"));
                usr.setPassword(rs.getString("password"));
                usr.setTipoUsuario(rs.getString("tipo_usuario"));

                usuarios.add(usr);
            }
        } catch (Exception e) {
            System.err.println("Error al listar: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // El orden de cierre recomendado es RS -> STMT -> CONN
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return usuarios;
    }

    // Metodo para registrar un nuevo usuario
    public int RegistrarUsuario(Usuario usr) {
        int result = 0;
        // SQL actualizado con los nombres de columnas reales de tu DB
        String sql = "INSERT INTO usuarios(nombre, correo, password, tipo_usuario) VALUES(?,?,?,?)";

        try (Connection conn = ConexionDao.ObtenerConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usr.getNombre());
            stmt.setString(2, usr.getCorreo());
            stmt.setString(3, usr.getPassword());
            stmt.setString(4, usr.getTipoUsuario());

            result = stmt.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error al registrar: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

}
