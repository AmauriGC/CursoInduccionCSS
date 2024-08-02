package mx.edu.utez.newcursoinduccion.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {

}) //Direcciones que va a proteger este filtro
public class filtroUsuario implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        // Obtener la sesión, si no existe devolverá null
        HttpSession session = httpRequest.getSession(false);

        // Variable para verificar si el usuario es cliente registrado
        boolean isUsuario = false;

        // Verificar si la sesión no es nula y si el atributo tipoRol está presente y es igual a "Cliente"
        if (session != null && "2".equals(session.getAttribute("id_rol"))) {
            isUsuario = true;
        }

        // Si es cliente, permitir el acceso
        if (isUsuario) {
            // Prevenir almacenamiento en caché
            httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
            httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
            httpResponse.setDateHeader("Expires", 0); // Proxies
            chain.doFilter(request, response);
        } else {
            // Si no es cliente o no hay sesión, redirigir a la página de acceso denegado
            httpResponse.sendRedirect("accesoDenegado.jsp");
        }
    }
}