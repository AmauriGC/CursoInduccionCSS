<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.newcursoinduccion.dao.GrupoAspiranteDao" %>
<%@ page import="mx.edu.utez.newcursoinduccion.model.GrupoAspirante" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrador</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
</head>
<body>
<div class="table-container">
    <table id="example" style="width: 100%">
        <thead>
        <tr>
            <th>id_grupo</th>
            <th>letra</th>
            <th>id_aspirante</th>
            <th>nombreA</th>
            <th>apellidosA</th>
            <th>correoA</th>
            <th>id_usuario</th>
            <th>nombreU</th>
            <th>apellidosU</th>
            <th>correoU</th>
            <th>id_materia</th>
            <th>nombreM</th>
        </tr>
        </thead>
        <tbody>
        <%
            GrupoAspiranteDao dao = new GrupoAspiranteDao();
            ArrayList<GrupoAspirante> lista = dao.getAllGA();

            for (GrupoAspirante g : lista) {%>
        <tr>
            <td><%=g.getId_grupo()%></td>
            <td><%=g.getLetra()%></td>
            <td><%=g.getId_aspirante()%></td>
            <td><%=g.getNombreA()%></td>
            <td><%=g.getApellidosA()%></td>
            <td><%=g.getCorreoA()%></td>
            <td><%=g.getId_usuario()%></td>
            <td><%=g.getNombreU()%></td>
            <td><%=g.getApellidosU()%></td>
            <td><%=g.getCorreoU()%></td>
            <td><%=g.getId_materia()%></td>
            <td><%=g.getNombreM()%></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/JS/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/JS/es-MX.json"></script>
<script>
    //Inicializar Data tables en la tabla objetivo
    document.addEventListener('DOMContentLoaded', () => {
        const table = document.getElementById('example');
        new DataTable(table, {
            language: {
                url: '${pageContext.request.contextPath}/JS/es-MX.json'
            }
        });
    });
</script>
</body>
</html>
