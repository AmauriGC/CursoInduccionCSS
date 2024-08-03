package mx.edu.utez.newcursoinduccion.dao;

import mx.edu.utez.newcursoinduccion.model.GrupoAspirante;
import mx.edu.utez.newcursoinduccion.model.Usuario;
import mx.edu.utez.newcursoinduccion.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GrupoAspiranteDao {

    //Programar una función R (lectura) para obtener un Aspirante
    //con el fin de hacer el inicio de sesión

    public GrupoAspirante getOneGA(int id_grupo) {
        GrupoAspirante g = new GrupoAspirante();
        String query = "select * from grupo_aspirante where id_grupo = ? ";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_grupo);
            // Ejecutamos la consulta
            if (ps.execute()) {
                // Obtenemos el resultado
                var rs = ps.getResultSet();
                if (rs.next()) {
                    g.setId_grupo(rs.getInt("id_grupo"));
                    g.setLetra(rs.getString("letra"));

                    g.setId_aspirante(rs.getInt("id_aspirante"));
                    g.setNombreA(rs.getString("nombreA"));
                    g.setApellidosA(rs.getString("apellidosA"));
                    g.setCorreoA(rs.getString("correoA"));

                    g.setId_usuario(rs.getInt("id_usuario"));
                    g.setNombreU(rs.getString("nombreU"));
                    g.setApellidosU(rs.getString("apellidosU"));
                    g.setCorreoU(rs.getString("correoU"));

                    g.setId_materia(rs.getInt("id_materia"));
                    g.setNombreM(rs.getString("nombreM"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return g;
    }

    //Seria la R del CRUD
    public ArrayList<GrupoAspirante> getAllGA() {
        ArrayList<GrupoAspirante> lista = new ArrayList<>();
        String query = "SELECT * FROM grupo_aspirante where id_grupo = ? ";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                GrupoAspirante g = new GrupoAspirante();
                //Entonces llenamos la información del usuario
                g.setId_grupo(rs.getInt("id_grupo"));
                g.setLetra(rs.getString("letra"));

                g.setId_aspirante(rs.getInt("id_aspirante"));
                g.setNombreA(rs.getString("nombreA"));
                g.setApellidosA(rs.getString("apellidosA"));
                g.setCorreoA(rs.getString("correoA"));

                g.setId_usuario(rs.getInt("id_usuario"));
                g.setNombreU(rs.getString("nombreU"));
                g.setApellidosU(rs.getString("apellidosU"));
                g.setCorreoU(rs.getString("correoU"));

                g.setId_materia(rs.getInt("id_materia"));
                g.setNombreM(rs.getString("nombreM"));

                lista.add(g);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}