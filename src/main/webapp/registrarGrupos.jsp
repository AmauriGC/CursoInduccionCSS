<%@ page import="mx.edu.utez.newcursoinduccion.model.Grupo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrar Grupo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/registrar_grupos.css">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
</head>
<body>
<section class="h-75 gradient-form box" style="background-color: #eee;">
    <div class="container py-5 h-75">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
                <div class="card rounded-3 text-black">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">
                                <div class="text-center">
                                    <h4 class="mt-1 mb-5 pb-1">
                                        <% if (request.getSession().getAttribute("grupo") == null) { %>
                                        Registrar <% } else { %>  <% } %>
                                    </h4>
                                    <p><% if (request.getSession().getAttribute("grupo") == null) { %>
                                        Registrar Grupos <% } else { %>  <% } %></p>
                                </div>

                                <!-- Formulario -->
                                <% HttpSession sesion = request.getSession();
                                    Grupo g = (Grupo) sesion.getAttribute("grupo");

                                    if (g == null) { %>

                                <form method="post" action="register">

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label">Letra</label>
                                        <input type="text" name="letra" class="form-control" placeholder="Letra"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label">Cantidad</label>
                                        <input type="number" name="cantidad" class="form-control"
                                               placeholder="Cantidad"/>
                                    </div>

                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <input type="hidden" name="operacion" value="registrar">
                                        <input type="submit" data-mdb-button-init data-mdb-ripple-init
                                               class="btn btn-outline-primary" value="Registrar">
                                        <a href="administrador.jsp" class="btn btn-outline-danger">Salir</a>
                                    </div>

                                </form>

                                <% } else { %>

                                <% } %>
                                <%
                                    sesion.removeAttribute("grupo");
                                    sesion.removeAttribute("mensaje");
                                %>
                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                            <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                <div class="text-center">
                                    <h4 class="mb-3">Ingresa los datos del grupo para registrar o actualizar.</h4>
                                    <p class="small mb-0">Estamos aquí para apoyarte en cada paso del camino.
                                        ¡Comencemos esta emocionante aventura educativa juntos!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
