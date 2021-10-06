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
public class insumos {
    private int id_insumo;
    private String nombre_material;
    private int unidad;
    private String rendimiento;
    private double precio;
    
    public insumos(){

}
    
    public insumos(String nombre_material, int unidad, String rendimiento, double precio){
        this.nombre_material = nombre_material;
        this.unidad = unidad;
        this.rendimiento = rendimiento;
        this.precio = precio;
    }

    public int getId_insumo() {
        return id_insumo;
    }

    public void setId_insumo(int id_insumo) {
        this.id_insumo = id_insumo;
    }

    public String getNombre_material() {
        return nombre_material;
    }

    public void setNombre_material(String nombre_material) {
        this.nombre_material = nombre_material;
    }

    public int getUnidad() {
        return unidad;
    }

    public void setUnidad(int unidad) {
        this.unidad = unidad;
    }

    public String getRendimiento() {
        return rendimiento;
    }

    public void setRendimiento(String rendimiento) {
        this.rendimiento = rendimiento;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public boolean guardarinsumos(){
        ConexionBD conexion = new ConexionBD();
        String sentencia ="INSERT INTO insumos(id_insumo,nombre_material,unidad,rendimiento,precio)"
                +"VALUES ('"+this.id_insumo+"','"+this.nombre_material+"','"+this.unidad+"','"+this.rendimiento+"','"+this.precio+"');";
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
    
    public boolean borrarinsumos(int id_insumo){
        String Sentencia ="DELETE FROM 'insumos' WHERE 'id_insumo'='"+ id_insumo+"'";
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
    
    public boolean actualizarinsumos() {
        ConexionBD conexion = new ConexionBD();
        String Sentencia = "UPDATE `insumos` SET id_insumo='" + this.id_insumo + "',nombre_material='" + this.nombre_material + "',unidad='" + this.unidad
                + "',rendimiento='" + this.rendimiento + "',precio='" + this.precio + "' WHERE id_insumo=" + this.id_insumo + ";";
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

    public List<insumos> listarinsumos() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<insumos> listainsumos = new ArrayList<>();
        String sql = "select * from insumos order by id_insumo asc";
        ResultSet rs = conexion.consultarBD(sql);
        insumos c;
        while (rs.next()) {
            c = new insumos();
            c.setId_insumo(rs.getInt("id_insumo"));
            c.setNombre_material(rs.getString("nombre_material"));
            c.setUnidad(rs.getInt("unidad"));
            c.setRendimiento(rs.getString("rendimiento"));
            c.setPrecio(rs.getDouble("precio"));
            listainsumos.add(c);

        }
        conexion.cerrarConexion();
        return listainsumos;
    }

    public insumos getinsumos() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from insumos where id_insumo='" + this.id_insumo + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.id_insumo = rs.getInt("id_insumo");
            this.nombre_material = rs.getString("nombre_material");
            this.unidad = rs.getInt("unidad");
            this.rendimiento = rs.getString("rendimiento");
            this.precio = rs.getDouble("precio");
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "insumos{" + "id_insumo=" + id_insumo + ", nombre_material=" + nombre_material + ", unidad=" + unidad + ", rendimento=" + rendimiento + ", precio=" + precio + '}';
    }
}
