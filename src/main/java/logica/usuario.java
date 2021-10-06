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
public class usuario {
    private int id;
    private String nombre;
    private double cedula;
    private double telefono;
    private String correo;
    private String contrasena;
    private String cargo;
    
    public usuario(){
        
    }
    
    public usuario(String nombre,double cedula,double telefono, String correo,String contrasena,String cargo){
        this.nombre = nombre;
        this.cedula = cedula;
        this.telefono = telefono;
        this.correo = correo;
        this.contrasena = contrasena;
        this.cargo = cargo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCedula() {
        return cedula;
    }

    public void setCedula(double cedula) {
        this.cedula = cedula;
    }

    public double getTelefono() {
        return telefono;
    }

    public void setTelefono(double telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    
    public boolean guardarusuario(){
        ConexionBD conexion = new ConexionBD();
        String sentencia ="INSERT INTO usuario(id,nombre,cedula,telefono,correo,contrasena,cargo)"
                +"VALUES ('"+this.id+"','"+this.nombre+"','"+this.cedula+"','"+this.telefono+"','"+this.correo+"','"+this.contrasena+"','"+this.cargo+"');";
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
    
    public boolean borrarusuario(int id){
        String Sentencia ="DELETE FROM 'usuario' WHERE 'id'='"+ id+"'";
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
    
    public boolean actualizarusuario() {
        ConexionBD conexion = new ConexionBD();
        String Sentencia = "UPDATE `usuario` SET id='" + this.id + "',nombre='" + this.nombre + "',cedula='" + this.cedula
                + "',telefono='" + this.telefono + "',correo='" + this.correo + "',contrasena='" + this.contrasena + "',cargo='" + this.cargo + "' WHERE id=" + this.id + ";";
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
    
    public List<usuario> listarusuario() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<usuario> listausuario = new ArrayList<>();
        String sql = "select * from usuario order by id asc";
        ResultSet rs = conexion.consultarBD(sql);
        usuario c;
        while (rs.next()) {
            c = new usuario();
            c.setId(rs.getInt("id"));
            c.setNombre(rs.getString("nombre"));
            c.setCedula(rs.getDouble("cedula"));
            c.setTelefono(rs.getDouble("telefono"));
            c.setCorreo(rs.getString("correo"));
            c.setContrasena(rs.getString("contrasena"));
            c.setCargo(rs.getString("cargo"));
            listausuario.add(c);

        }
        conexion.cerrarConexion();
        return listausuario;
    }
    
     public usuario getusuario() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from usuario where id='" + this.id + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.id = rs.getInt("id");
            this.nombre = rs.getString("nombre");
            this.cedula = rs.getDouble("cedula");
            this.telefono = rs.getDouble("telefono");
            this.correo = rs.getString("correo");
            this.contrasena = rs.getString("contrasena");
            this.cargo = rs.getString("cargo");
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "usuario{" + "id=" + id + ", nombre=" + nombre + ", cedula=" + cedula + ", telefono=" + telefono + ", correo=" + correo + ", contrasena=" + contrasena + ", cargo=" + cargo + '}';
    }
}
