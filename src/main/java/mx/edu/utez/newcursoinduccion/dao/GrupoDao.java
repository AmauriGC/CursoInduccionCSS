package mx.edu.utez.newcursoinduccion.dao;

import mx.edu.utez.newcursoinduccion.model.Grupo;
import mx.edu.utez.newcursoinduccion.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GrupoDao {

    //Programar una función R (lectura) para obtener un grupo
    //con el fin de hacer el inicio de sesión

    public Grupo getOneG(int id_grupo) {
        Grupo g = new Grupo();
        String query = "select * from grupos where id_grupo = ? ";
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
                    g.setCantidad(rs.getInt("cantidad"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return g;
    }

    //insertar grupos
    public boolean insertG(Grupo g) {
        boolean flag = false;
        String query = "insert into grupos (letra,cantidad) values (?,?) ";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, g.getLetra());
            ps.setInt(2, g.getCantidad());
            if (ps.executeUpdate() == 1) {
                flag = true;//Porque significa que si se inserto en la BD
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    //Seria la R del CRUD
    public ArrayList<Grupo> getAllG() {
        ArrayList<Grupo> lista = new ArrayList<>();
        String query = "select * from grupos";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Grupo g = new Grupo();
                //Entonces llenamos la información del usuario
                g.setId_grupo(rs.getInt("id_grupo"));
                g.setLetra(rs.getString("letra"));
                g.setCantidad(rs.getInt("cantidad"));
                lista.add(g);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}