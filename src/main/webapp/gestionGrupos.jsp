<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.newcursoinduccion.dao.GrupoDao" %>
<%@ page import="mx.edu.utez.newcursoinduccion.model.Grupo" %>
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
            <th>Grupo</th>
            <th>Letra</th>
            <th>Cantidad</th>
        </tr>
        </thead>
        <tbody>
        <%
            GrupoDao dao = new GrupoDao();
            ArrayList<Grupo> lista = dao.getAllG();
            for (Grupo g : lista) {%>
        <tr>
            <td><%=g.getId_grupo()%></td>
            <td><%=g.getLetra()%></td>
            <td><%=g.getCantidad()%></td>
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
