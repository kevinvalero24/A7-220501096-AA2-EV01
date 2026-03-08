<%-- 
    Document   : index
    Created on : 8/03/2026, 10:58:21 a. m.
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <title>Control de Circuitos</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Iconos -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <style>

            body{
                height:100vh;
                display:flex;
                justify-content:center;
                align-items:center;
                background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
                font-family: Arial;
            }

            .card{
                width:420px;
                border-radius:15px;
                box-shadow:0px 15px 40px rgba(0,0,0,0.3);
            }

            .titulo{
                text-align:center;
                font-weight:bold;
                color:#2c5364;
            }

            .icono{
                font-size:50px;
                color:#2c5364;
                text-align:center;
                margin-bottom:10px;
            }

            .btn-registro{
                background:#2c5364;
                color:white;
                font-weight:bold;
            }

            .btn-registro:hover{
                background:#203a43;
                color:white;
            }

        </style>

    </head>

    <body>

        <div class="card p-4">

            <div class="icono">
                <i class="fa-solid fa-bolt"></i>
            </div>

            <h3 class="titulo">Control de Circuitos</h3>

            <p class="text-center text-muted mb-4">
                Registro de usuarios del sistema
            </p>

            <form action="UsuarioControl?accion=guardar" method="POST">

                <div class="mb-3">

                    <label class="form-label">
                        <i class="fa-solid fa-user"></i> Nombre
                    </label>

                    <input type="text" name="nombre" class="form-control" placeholder="Ingrese su nombre" required>

                </div>

                <div class="mb-3">

                    <label class="form-label">
                        <i class="fa-solid fa-envelope"></i> Correo
                    </label>

                    <input type="email" name="correo" class="form-control" placeholder="correo@email.com" required>

                </div>

                <div class="mb-3">

                    <label class="form-label">
                        <i class="fa-solid fa-lock"></i> Contraseña
                    </label>

                    <input type="password" name="password" class="form-control" required>

                </div>

                <div class="mb-4">

                    <label class="form-label">
                        <i class="fa-solid fa-user-gear"></i> Tipo de Usuario
                    </label>

                    <select name="tipo_usuario" class="form-select">

                        <option value="normal">Usuario Normal</option>
                        <option value="tecnico">Técnico</option>
                        <option value="admin">Administrador</option>

                    </select>

                </div>

                <div class="d-grid">

                    <button type="submit" class="btn btn-registro">
                        <i class="fa-solid fa-user-plus"></i> Registrar Usuario
                    </button>

                </div>

            </form>

        </div>

    </body>
</html>