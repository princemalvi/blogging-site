package dao;

import java.util.*;
import java.sql.*;
import models.User;
import db.Database;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;   

public class AdminDao{
    Connection con;
    public AdminDao(){
        Database db = new Database();
        try{
            con = db.connect();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public boolean login(String email,String password) throws Exception{
        try{
            String query = "select  * from admin where adminname=? and adminpassword=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                System.out.println("YEs True");
                return true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }


    public boolean approve(int id) throws Exception{
        int rs = 0;
        try{
            String query = "update blogs set status = 1 where blogid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            rs = ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
        return rs != 0;
    }

    public boolean reject(int id) throws Exception{
        int rs = 0;
        try{
            String query = "update blogs set status = 2 where blogid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            rs = ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
        return rs != 0;
    }


}