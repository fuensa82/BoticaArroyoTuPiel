/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.arroyo.utils;

import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author vpalomo
 */
public class Utils {

    public static void ponColumnaEnTabla(JTable jTableHistoria, ArrayList<String> cabeceras, int indice) {
        DefaultTableModel modelo=(DefaultTableModel) jTableHistoria.getModel();
        for (int i=0;i<cabeceras.size();i++) {
            if(modelo.getRowCount()<cabeceras.size()){
                modelo.addRow(new String[]{"",""});
            }
            modelo.setValueAt(cabeceras.get(i), i, indice);
        }
    }
}
