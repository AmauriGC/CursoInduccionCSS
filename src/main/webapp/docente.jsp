<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrador</title>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>

    <!-- Bootstrap core CSS -->
    <link href="CSS/boot.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/docente.css">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-brown">

        <a class="colorF" href="docente.jsp">Docente</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                </li>
            </ul>
            <a class="nav-link colorF" href="index.jsp">Cerrar Sesion</a>
        </div>

    </nav>
</header>

<br><br><br><br>

<main role="main">

    <div class="container marketing">

        <div class="row">
            <div class="col-lg-4">
                <img class="rounded-circle"
                     src="img/icon_aspirante2.png"
                     alt="aspirante image" width="80" height="80">
                <h2>Gestionar Aspirantes</h2>
                <p>En este apartado podran ver los detalles de los aspirantes dados de alta en el sistema.</p>
                <p><a class="btn bg-color-blue" href="gestionAspiranteDocente.jsp" role="button">Entrar &raquo;</a></p>
            </div><!-- /.col-lg-4 -->

            <div class="col-lg-4">
                <img class="rounded-circle"
                     src="img/icon_grupos2.png"
                     alt="grupos image" width="80" height="80">
                <h2>Gestionar Grupos</h2>
                <p>En este apartado podran ver los grupos que existen en total.</p>
                <p><a class="btn bg-color-blue" href="gestionGrupos.jsp" role="button">Entrar &raquo;</a></p>
            </div><!-- /.col-lg-4 -->

            <div class="col-lg-4">
                <img class="rounded-circle"
                     src="img/icon_download.png"
                     alt="grupos image" width="80" height="80">
                <h2>Descargar datos</h2>
                <p>En este apartado podran descargar los datos en formato pdf.</p>
                <p><a class="btn bg-color-blue" href="gestionDatos.jsp" role="button">Entrar &raquo;</a></p>
            </div><!-- /.col-lg-4 -->

        </div><!-- /.row -->
    </div>

</main>
</body>
</html>
