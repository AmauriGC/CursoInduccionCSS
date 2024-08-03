package mx.edu.utez.newcursoinduccion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.newcursoinduccion.dao.GrupoAspiranteDao;
import mx.edu.utez.newcursoinduccion.model.GrupoAspirante;

import java.io.IOException;

@WebServlet(name = "GestionarGruposAspirantesServlet", value = "/ges_gru_as")
public class GestionarGruposAspirantesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_grupo = Integer.parseInt(req.getParameter("id_grupo"));
        GrupoAspiranteDao dao = new GrupoAspiranteDao();
        GrupoAspirante g = dao.getOneGA(id_grupo);
        HttpSession sesion = req.getSession();
        sesion.setAttribute("grupo", g);
        resp.sendRedirect("registrarGrupos.jsp");
    }
}