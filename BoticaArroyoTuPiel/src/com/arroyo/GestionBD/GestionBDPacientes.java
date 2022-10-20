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
import javax.naming.NamingException;

/**
 *
 * @author vpalomo
 */
public class GestionBDPacientes {
    public static ArrayList<PacienteBeans> getListaPacientes(String filtro){
        ArrayList<PacienteBeans> lista = new ArrayList();
        Connection conexion = null;
        try {
            conexion = ConectorBD.getConnection();
            PacienteBeans paciente;
            PreparedStatement consulta = conexion.prepareStatement(
                    "SELECT idPaciente,nombre,apellidos,fechaNacimiento,sexo FROM pacientes "
                            + "WHERE nombre LIKE ? OR apellidos LIKE ?");
            consulta.setString(1, "%" + filtro + "%");
            consulta.setString(2, "%" + filtro + "%");
            
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                paciente = new PacienteBeans();
                paciente.setIdPaciente(resultado.getString(1));
                paciente.setNombre(resultado.getString(2));
                paciente.setApellidos(resultado.getString(3));
                paciente.setFechaNacimiento(FechasUtils.fecha(resultado.getString(4)));
                paciente.setSexo(resultado.getString(5));
                lista.add(paciente);
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
        return lista;
    }
    public static ArrayList<PacienteBeans> getListaPacientes(){
        ArrayList<PacienteBeans> lista = new ArrayList();
        Connection conexion = null;
        try {
            conexion = ConectorBD.getConnection();
            PacienteBeans paciente;
            PreparedStatement consulta = conexion.prepareStatement(
                    "SELECT idPaciente,nombre,apellidos,fechaNacimiento,sexo FROM pacientes");
            
            ResultSet resultado = consulta.executeQuery();
            while (resultado.next()) {
                paciente = new PacienteBeans();
                paciente.setIdPaciente(resultado.getString(1));
                paciente.setNombre(resultado.getString(2));
                paciente.setApellidos(resultado.getString(3));
                paciente.setFechaNacimiento(FechasUtils.fecha(resultado.getString(4)));
                paciente.setSexo(resultado.getString(5));
                lista.add(paciente);
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
        return lista;
    }
}
