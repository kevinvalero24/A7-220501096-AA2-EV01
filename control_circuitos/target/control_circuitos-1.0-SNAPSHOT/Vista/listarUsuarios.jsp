<%-- 
    Document   : listarUsuarios
    Created on : 8/03/2026, 12:26:41 p. m.
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Lista de Usuarios</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="container mt-5">

        <h2 class="text-center mb-4">Lista de Usuarios</h2>

        <jsp:include page="/Componentes/Mensajes.jsp"/>

        <div class="text-end mb-3">
            <a href="../UsuarioControl?accion=nuevo" class="btn btn-primary">
                Nuevo Usuario
            </a>
        </div>

        <table class="table table-bordered table-striped">

            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                </tr>
            </thead>

            <tbody>

                <%
                    java.util.List<Modelo.Usuario> lista
                            = (java.util.List<Modelo.Usuario>) request.getAttribute("usuarios");

                    if (lista != null) {
                        for (Modelo.Usuario u : lista) {
                %>

                <tr>
                    <td><%= u.getId()%></td>
                    <td><%= u.getNombre()%></td>
                    <td><%= u.getCorreo()%></td>
                </tr>

                <%
                        }
                    }
                %>

            </tbody>

        </table>

    </body>
</html>