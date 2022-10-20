/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.arroyo.GestionBD;

import com.arroyo.beans.PacienteBeans;
import com.arroyo.utils.ConectorBD;
import com.arroyo.utils.FechasUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.naming.NamingException;

/**
 *
 * @author vpalomo
 */
public class GestionBDEstructuraTabla {
    public static HashMap getColumnas1y2Tabla(){
        HashMap<String, ArrayList> columnas=new HashMap();
        ArrayList<String> lista1 = new ArrayList();
        ArrayList<String> lista2 = new ArrayList();
        columnas.put("COL1", lista1);
        columnas.put("COL2", lista2);
        Connection conexion = null;
        try {
            conexion = ConectorBD.getConnection();
            PreparedStatement consulta = conexion.prepareStatement(
                    "SELECT valores.idSonda, valores.idPartecuerpo, sondas.nombreSonda, partescuerpo.parte FROM " +
                    "valores, sondas, partescuerpo " +
                    "WHERE valores.idSonda=sondas.idSonda AND valores.idPartecuerpo=partescuerpo.idParte " +
                    "GROUP BY valores.idPartecuerpo");
            
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                lista1.add(resultado.getString(3));
                lista2.add(resultado.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException ex) {

        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
            }
        }
        return columnas;
    }
}
