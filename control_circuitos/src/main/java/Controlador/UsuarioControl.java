/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UsuarioControl")
public class UsuarioControl extends HttpServlet {

    private UsuarioDao usuarioDao = new UsuarioDao();

    private final String listarUsuarios = "/Vista/listarUsuarios.jsp";
    private final String nuevoUsuario = "/Vista/nuevoUsuario.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {

            case "listar":
                request.setAttribute("usuarios", usuarioDao.ListarUsuarios());
                request.getRequestDispatcher(listarUsuarios).forward(request, response);
                break;

            case "nuevo":
                request.getRequestDispatcher(nuevoUsuario).forward(request, response);
                break;

            default:
                response.sendRedirect("UsuarioControl?accion=listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("guardar".equals(accion)) {
            Usuario usr = new Usuario();

            usr.setNombre(request.getParameter("nombre"));
            usr.setCorreo(request.getParameter("correo"));
            usr.setPassword(request.getParameter("password"));

            // ASIGNAR TIPO POR DEFECTO
            // Esto evita que la DB rechace el registro por un campo null
            usr.setTipoUsuario("usuario");

            int result = usuarioDao.RegistrarUsuario(usr);

            if (result > 0) {
                request.getSession().setAttribute("success", "Usuario registrado correctamente");
            } else {
                request.getSession().setAttribute("error", "No se pudo registrar el usuario");
            }

            response.sendRedirect("UsuarioControl?accion=listar");
        }
    }
}
