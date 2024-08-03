package mx.edu.utez.newcursoinduccion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.newcursoinduccion.dao.UsuarioDao;
import mx.edu.utez.newcursoinduccion.model.Usuario;

import java.io.IOException;

@WebServlet(name = "UsuarioServlet", value = "/login")
public class UsuarioServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_usuario = Integer.parseInt(req.getParameter("id_usuario"));

        UsuarioDao dao = new UsuarioDao();
        Usuario u = dao.getOne(id_usuario);

        HttpSession sesion = req.getSession();
        sesion.setAttribute("usuario", u);

        resp.sendRedirect("registrarUsuario.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1) Obtener la información del formulario
        String correo = req.getParameter("correo");
        String contra = req.getParameter("contra");
        String ruta = "index.jsp";

        // 2) Conectarse a la base de datos y buscar al usuario según las credenciales del formulario
        UsuarioDao dao = new UsuarioDao();
        Usuario u = dao.getOne(correo, contra);

        if (u.getCorreo() == null) {
            // El usuario no existe en la base de datos
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje", "El usuario no existe en la base de datos");
            resp.sendRedirect(ruta);
        } else {
            // El usuario sí existe en la base de datos
            HttpSession sesion = req.getSession();
            sesion.setAttribute("usuario", u);

            int id_rol = u.getId_rol();
            sesion.setAttribute("id_rol", id_rol);  // Establecer el id_rol en la sesión

            switch (id_rol) {
                case 1: // es administrador
                    ruta = "administrador.jsp";
                    break;
                case 2: // es docente
                    ruta = "docente.jsp";
                    break;
                default:
                    sesion.setAttribute("mensaje", "Rol no reconocido");
                    ruta = "index.jsp";
                    break;
            }
            resp.sendRedirect(ruta);
        }
    }
}
