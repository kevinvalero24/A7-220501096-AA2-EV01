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
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDao {

    // Datos de conexión a la base de datos de tu proyecto
    public static final String URL = "jdbc:mysql://localhost:3306/control_circuitos";
    public static final String USER = "root";
    public static final String PASWORD = "";

    // Método para obtener la conexión
    public static Connection ObtenerConexion() throws ClassNotFoundException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASWORD);
        } catch (SQLException e) {
            System.out.println("Error de conexión: " + e.getMessage());
        }
        return conn;
    }

    // Método main para probar la conexión
    public static void main(String[] args) {
        try {
            Connection test = ConexionDao.ObtenerConexion();

            if (test != null) {
                System.out.println("Conexión probada correctamente con la base de datos.");
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }

        } catch (ClassNotFoundException ex) {
            System.out.println("Error al cargar el driver: " + ex.getMessage());
        }
    }
}