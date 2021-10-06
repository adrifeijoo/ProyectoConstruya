/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Adriana Feijoo Almonacid
 */
public class ConexionBD {
    private String DB_driver= "";
    private String url= "";
    private String db= "";
    private String host = "";
    private String username = "";
    private String password = "";
    public Connection con = null;
    private Statement stmt= null;
    private PreparedStatement pstmt= null;
    private ResultSet rs= null;
    private boolean local;
//Constructor sin parmetros
    public ConexionBD() {
        local = true;//pude establecer este valor en falso para conectarse al servidor remoto
        DB_driver= "com.mysql.jdbc.Driver";
        if (local) {
            host = "localhost:3306";
            db= "construya";
            url= "jdbc:mysql://" + host + "/" + db; //URL DB
            username= "root"; //usuario base de datos global
            password = "Dasher.2794";
        } else {
            host = "mysql1007.mochahost.com:3306";
            db= "construya";
            url= "jdbc:mysql://" + host + "/" + db; //URL DB
            username= "root"; //usuario base de datos global
            password = "Dasher.2794";
        }
        try {
//Asignacindel Driver
            Class.forName(DB_driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {// Realizarla conexion
            con = DriverManager.getConnection(url, username, password);
            con.setTransactionIsolation(8);
            System.out.println("conectado");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
// Realizar la conexin
// Realizar la conexin
// Realizar la conexin
// Realizar la conexin
    }
//Retornar la conexin
    public Connection getConnection() {
        return con;
    }
//Cerrarla conexin
    public void closeConnection(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

// Mtodoque devuelve un ResultSetde una consulta (tratamiento de SELECT)
    public ResultSet consultarBD(String sentencia) {
        try {
            stmt= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs= stmt.executeQuery(sentencia);
        } catch (SQLException sqlex) {
//catch (RuntimeException rex) {
//} catch (Exception ex) {
//}
        }
        return rs;
    }
// Mtodoque realiza un INSERT y devuelve TRUE si la operacinfue existosa
    public boolean insertarBD(String sentencia) {
        try {
            stmt= con.createStatement();
            stmt.execute(sentencia);
        } catch (SQLException | RuntimeException sqlex) {
            System.out.println("ERROR RUTINA: " + sqlex);
            return false;
        }
        return true;
    }
    public boolean borrarBD(String sentencia) {
        try {
            stmt= con.createStatement();
            stmt.execute(sentencia);
        } catch (SQLException | RuntimeException sqlex) {
            System.out.println("ERROR RUTINA: " + sqlex);
            return false;
        }
        return true;
    }
// Mtodoque realiza una operacincomo UPDATE, DELETE, CREATE TABLE, entre otras
// y devuelve TRUE si la operacinfue existosa
    public boolean actualizarBD(String sentencia) {
        try {
            stmt= con.createStatement();
            stmt.executeUpdate(sentencia);
        } catch (SQLException | RuntimeException sqlex) {
            System.out.println("ERROR RUTINA: " + sqlex);
            return false;
        }
        return true;
    }
    public boolean setAutoCommitBD(boolean parametro) {
        try {
            con.setAutoCommit(parametro);
        } catch (SQLException sqlex) {
            System.out.println("Error al configurarelautoCommit" + sqlex.getMessage());
            return false;
        }
        return true;
    }

    public void cerrarConexion() {
        closeConnection(con);
    }
/**
public boolean setAutoCommitBD(boolean parametro) {
try {
con.setAutoCommit(parametro);
} catch (SQLException sqlex) {
System.out.println("Error al configurarelautoCommit" + sqlex.getMessage());
return false;
}
return true;
}
public void cerrarConexion() {
closeConnection(con);
}*/
    public boolean commitBD() {
        try {
            con.commit();
            return true;
        } catch (SQLException sqlex) {
            System.out.println("Error al hacercommit " + sqlex.getMessage());
            return false;
        }
    }
    public boolean rollbackBD() {
        try {
            con.rollback();
            return true;
        } catch (SQLException  sqlex) {
            System.out.println("Error al hacerrollback " + sqlex.getMessage());
            return false;
        }
    }
    public static void main(String[] args) {
        ConexionBD b = new ConexionBD();
        b.cerrarConexion();
    }
}
