
package db;

import java.sql.*; 

public class Database {
    Connection con;
    public Connection connect() throws SQLException, ClassNotFoundException {
        String dbDriver = "com.mysql.jdbc.Driver"; 
        String dbURL = "jdbc:mysql://localhost:3306/"; 
        String dbName = "freeblogger"; 
        String dbUsername = "root"; 
        String dbPassword = ""; 
 
        Class.forName(dbDriver); 
        this.con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword); 
        return this.con;
    }
    
    public void close() throws SQLException, ClassNotFoundException {
        this.con.close();
    }
}
