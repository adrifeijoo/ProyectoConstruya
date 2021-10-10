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
public class Insumo {
    
    private int id_insumo;
    private String nombre_material;
    private String unidad;
    private String rendimiento;
    private double precio;
    
    public Insumo(){

}
    // se puede cambiar segun el tutor 
    public Insumo getInsumo(int id_insumo) throws SQLException{
        this.id_insumo=id_insumo;
        return this.getInsumo();
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

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
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
    
    public boolean guardarInsumo(){
        ConexionBD conexion = new ConexionBD();
        String sentencia ="INSERT INTO insumos(id_insumo, nombre_material, unidad, rendimiento, precio) "
                +" VALUES ('" + this.id_insumo + "','" + this.nombre_material 
                + "','" + this.unidad + "','" + this.rendimiento + "','" 
                + this.precio + "'); ";
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
    
    public boolean borrarInsumo(int id_insumo){
        String Sentencia ="DELETE FROM `insumos` WHERE `id_insumo`='" + id_insumo + "'";
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
    
    public boolean actualizarInsumo() {
        ConexionBD conexion = new ConexionBD();
        String Sentencia = "UPDATE `insumos` SET nombre_material='" + this.nombre_material + "',unidad='" + this.unidad
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

    public List<Insumo> listarInsumos() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<Insumo> listaInsumos = new ArrayList<>();
        String sql = "select * from insumos order by id_insumo asc";
        ResultSet rs = conexion.consultarBD(sql);
        Insumo c;
        while (rs.next()) {
            c = new Insumo();
            c.setId_insumo(rs.getInt("id_insumo"));
            c.setNombre_material(rs.getString("nombre_material"));
            c.setUnidad(rs.getString("unidad"));
            c.setRendimiento(rs.getString("rendimiento"));
            c.setPrecio(rs.getDouble("precio"));
            listaInsumos.add(c);

        }
        conexion.cerrarConexion();
        return listaInsumos;
    }

    public Insumo getInsumo() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from insumos where id_insumo='" + this.id_insumo + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.id_insumo = rs.getInt("id_insumo");
            this.nombre_material = rs.getString("nombre_material");
            this.unidad = rs.getString("unidad");
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
        return "Insumo{" + "id_insumo=" + id_insumo + ", nombre_material=" + nombre_material + ", unidad=" + unidad + ", rendimento=" + rendimiento + ", precio=" + precio + '}';
    }
}
