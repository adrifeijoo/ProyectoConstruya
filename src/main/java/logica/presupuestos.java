/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author Adriana Feijoo Almonacid
 */
public class presupuestos {
    private int id;
     private String espacio;
     private int medidas;
     private String lista_materiales;
     private double valor;
     
     public presupuestos(){
         
     }
     
     public presupuestos(String espacio, int medidas, String lista_materiales, double valor){
         this.espacio = espacio;
         this.medidas = medidas;
         this.lista_materiales = lista_materiales;
         this.valor = valor;
     }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEspacio() {
        return espacio;
    }

    public void setEspacio(String espacio) {
        this.espacio = espacio;
    }

    public int getMedidas() {
        return medidas;
    }

    public void setMedidas(int medidas) {
        this.medidas = medidas;
    }

    public String getLista_materiales() {
        return lista_materiales;
    }

    public void setLista_materiales(String lista_materiales) {
        this.lista_materiales = lista_materiales;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
     
     public boolean guardarpresupuestos(){
        ConexionBD conexion = new ConexionBD();
        String sentencia ="INSERT INTO presupuesto_usuario(id,espacio,medidas,lista_materiales,valor)"
                +"VALUES ('"+this.id+"','"+this.espacio+"','"+this.medidas+"','"+this.lista_materiales+"','"+this.valor+"');";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }else{
            conexion.cerrarConexion();
            return false;
        }
    }
     
     public boolean borrarpresupuesto(int id){
        String Sentencia ="DELETE FROM 'presupuesto_usuario' WHERE 'id'='"+ id+"'";
        ConexionBD conexion = new ConexionBD();
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(Sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }else{
            conexion.cerrarConexion();
            return false;
        }
    }
     
     public boolean actualizarpresupuestos() {
        ConexionBD conexion = new ConexionBD();
        String Sentencia = "UPDATE `presupuesto_usuario` SET id='" + this.id + "',espacio='" + this.espacio + "',medidas='" + this.medidas
                + "',lista_materiales='" + this.lista_materiales + "',valor='" + this.valor + "' WHERE id=" + this.id + ";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(Sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
     
     public List<presupuestos> listarpresupuestos() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<presupuestos> listapresupuestos = new ArrayList<>();
        String sql = "select * from presupuesto_usuario order by id asc";
        ResultSet rs = conexion.consultarBD(sql);
        presupuestos c;
        while (rs.next()) {
            c = new presupuestos();
            c.setId(rs.getInt("id"));
            c.setEspacio(rs.getString("espacio"));
            c.setMedidas(rs.getInt("medidas"));
            c.setLista_materiales(rs.getString("lista_materiales"));
            c.setValor(rs.getDouble("valor"));
            listapresupuestos.add(c);

        }
        conexion.cerrarConexion();
        return listapresupuestos;
    }
     
      public presupuestos getpresupuestos() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from presupuesto_usuario where id='" + this.id + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.id = rs.getInt("id");
            this.espacio = rs.getString("espacio");
            this.medidas = rs.getInt("medidas");
            this.lista_materiales = rs.getString("lista_materiales");
            this.valor = rs.getDouble("valor");
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "presupuesto_usuario{" + "id=" + id + ", espacio=" + espacio + ", medidas=" + medidas + ", lista_materiales=" + lista_materiales + ", valor=" + valor + '}';
    }
}
