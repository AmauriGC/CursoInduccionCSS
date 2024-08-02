<%@ page import="mx.edu.utez.newcursoinduccion.model.Aspirante" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrar Aspirante</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/registrar_aspirante.css">
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
                                        <% if (request.getSession().getAttribute("aspirante") == null) { %>
                                        Registrar <% } else { %> Actualizar <% } %>
                                    </h4>
                                    <p><% if (request.getSession().getAttribute("aspirante") == null) { %> Registrar
                                        Aspirantes <% } else { %> Actualizar Aspirantes <% } %></p>
                                </div>

                                <!-- Formulario -->
                                <% HttpSession sesion = request.getSession();
                                    Aspirante a = (Aspirante) sesion.getAttribute("aspirante");
                                    if (a == null) { %>

                                <form method="post" action="sign_in_a">

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="text" name="nombre" class="form-control" placeholder="Nombre"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="text" name="apellidos" class="form-control"
                                               placeholder="Apellidos"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="email" name="correo" class="form-control" placeholder="Correo"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="tel" name="telefono" class="form-control" placeholder="Telefono"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="text" name="curp" class="form-control" placeholder="CURP"/>
                                    </div>

                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <input type="hidden" name="operacion" value="registrar">
                                        <input type="submit" data-mdb-button-init data-mdb-ripple-init
                                               class="btn btn-outline-primary" value="Registrar">
                                        <input type="submit" data-mdb-button-init data-mdb-ripple-init
                                               class="btn btn-outline-primary" value="Registrar Excel">
                                        <a href="administrador.jsp" class="btn btn-outline-danger">Salir</a>
                                    </div>

                                </form>

                                <% } else { %>

                                <form method="post" action="sign_in_a">

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="text" name="nombre" class="form-control" value="<%=a.getNombre()%>"
                                               placeholder="Nombre"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="text" name="apellidos" class="form-control"
                                               value="<%=a.getApellidos()%>" placeholder="Apellidos"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="email" name="correo" class="form-control"
                                               value="<%=a.getCorreo()%>" placeholder="Correo"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="tel" name="telefono" class="form-control"
                                               value="<%=a.getTelefono()%>" placeholder="Telefono"/>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="text" name="curp" class="form-control" value="<%=a.getCurp()%>"
                                               placeholder="CURP"/>
                                    </div>

                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <input type="hidden" name="operacion" value="actualizar">
                                        <input type="hidden" name="id_aspirante" value="<%=a.getId_aspirante()%>">
                                        <input type="submit" data-mdb-button-init data-mdb-ripple-init
                                               class="btn btn-outline-primary" value="Actualizar">
                                        <a href="administrador.jsp" class="btn btn-outline-danger">Salir</a>
                                    </div>

                                </form>

                                <% } %>
                                <%
                                    sesion.removeAttribute("aspirante");
                                    sesion.removeAttribute("mensaje");
                                %>
                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                            <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                <div class="text-center">
                                    <h4 class="mb-3">Ingresa los datos del aspirante para registrar o actualizar.</h4>
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
