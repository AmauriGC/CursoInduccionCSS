package mx.edu.utez.newcursoinduccion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.newcursoinduccion.dao.GrupoDao;
import mx.edu.utez.newcursoinduccion.model.Grupo;

import java.io.IOException;

@WebServlet(name = "RegistrarGruposServlet", value = "/register")
public class RegistrarGruposServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_grupo = Integer.parseInt(req.getParameter("id_grupo"));
        GrupoDao dao = new GrupoDao();
        Grupo g = dao.getOneG(id_grupo);
        HttpSession sesion = req.getSession();
        sesion.setAttribute("grupo", g);
        resp.sendRedirect("registrarGrupos.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");
        HttpSession sesion = req.getSession();

        if (operacion.equals("registrar")) {

            String letra = req.getParameter("letra");
            int cantidad = Integer.parseInt(req.getParameter("cantidad"));
            String ruta = "gestionGrupos.jsp";

            Grupo g = new Grupo();
            g.setLetra(letra);
            g.setCantidad(cantidad);

            GrupoDao dao = new GrupoDao();
            boolean insertado = dao.insertG(g);

            if (insertado) {
                sesion.setAttribute("mensaje2", "Registro exitoso");
                resp.sendRedirect(ruta);
            } else {
                sesion.setAttribute("mensaje3", "El grupo no se registró correctamente");
                resp.sendRedirect("registrarGrupos.jsp");
            }

        } else {
            sesion.setAttribute("mensaje", "Operación no válida");
            resp.sendRedirect("gestionGrupos.jsp");
        }
    }
}
