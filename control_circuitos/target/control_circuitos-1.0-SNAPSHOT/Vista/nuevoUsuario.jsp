<%-- 
    Document   : nuevoUsuario
    Created on : 8/03/2026, 12:27:49 p. m.
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nuevo Usuario</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="container mt-5">

        <h2 class="text-center mb-4">Registrar Usuario</h2>

        <jsp:include page="../Mensajes.jsp"/>

        <form action="../UsuarioControl?accion=guardar" method="post">

            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Correo</label>
                <input type="email" name="correo" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Contraseña</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <div class="text-center">

                <button type="submit" class="btn btn-success">
                    Guardar
                </button>

                <a href="../UsuarioControl?accion=listar" class="btn btn-secondary">
                    Cancelar
                </a>

            </div>

        </form>

    </body>
</html>
