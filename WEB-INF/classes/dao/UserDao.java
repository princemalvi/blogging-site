package dao;

import java.util.*;
import java.sql.*;
import models.User;
import db.Database;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;   

public class UserDao{
    Connection con;
    public UserDao(){
        Database db = new Database();
        try{
            con = db.connect();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public User login(String email,String password) throws Exception{
        User user = new User();
        try{
            String query = "select  * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                user.setUserid(rs.getInt("userid"));
                user.setName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setProfile(rs.getString("profile"));
                user.setBio(rs.getString("bio"));
                return user;
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public boolean save(User user) throws Exception{
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
        LocalDateTime now = LocalDateTime.now();  
        int res = 0; 
        try{
            String query = "insert into user(email,password,username,dateregistered) values(?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,user.getEmail());
            ps.setString(2,user.getPassword());
            ps.setString(3,user.getName());
            ps.setString(4,dtf.format(now));
            System.out.println(query);
            res = ps.executeUpdate();
        } catch (SQLException ex) {
            throw new Exception("Error " + ex.getMessage());
        }
        return res != 0;
    }


    public boolean update(User user) throws Exception{
        int res = 0; 
        String query;
        PreparedStatement ps;
        System.out.println("User Profile = " + user.getProfile());
        try{
            // if(user.getProfile().equals("null")){
            //     System.out.println("In NULL");
            //     query = "update user set username=?,bio=? where userid=?";
            //     ps = con.prepareStatement(query);
            //     ps.setString(1,user.getName());
            //     ps.setString(2,user.getBio());
            //     ps.setInt(3,user.getUserid());
            // }else{
                System.out.println("In Not NULL");
                query = "update user set username=?,bio=?,profile=? where userid=?";
                ps = con.prepareStatement(query);
                ps.setString(1,user.getName());
                System.out.println("In Dao bio =  " + user.getBio());
                ps.setString(2,user.getBio());
                ps.setString(3,user.getProfile());
                ps.setInt(4,user.getUserid());
                System.out.println(query);
            // }
            res = ps.executeUpdate();
            System.out.print("Result " + res);
        } catch (SQLException ex) {
            throw new Exception("Error " + ex.getMessage());
        }
        return res != 0;
    }


    public List<User> userList() throws Exception{
        List<User> users = new ArrayList<User>();
        try {
            String sql = "SELECT * FROM user";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("userid"));
                user.setName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setProfile(rs.getString("profile"));
                user.setBio(rs.getString("bio"));
                users.add(user);
            }
        } catch (SQLException ex) {
            throw new Exception("Veritabani Hatasi = " + ex.getMessage());
        }
        return users;
    }



     public User find(int id) throws Exception{
        User user = new User();
        try {
            String sql = "SELECT * FROM user WHERE userid=? LIMIT 1";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                user.setUserid(rs.getInt("userid"));
                user.setName(rs.getString("username"));
                user.setProfile(rs.getString("profile"));
                user.setEmail(rs.getString("email"));
                user.setBio(rs.getString("bio"));
            }
        } catch (SQLException ex) {
            throw new Exception(ex.getMessage());
        }
        return user;
    }


    public boolean delete(int id) throws Exception {
        int status = 0;
        try {
            String sql = "DELETE FROM user WHERE userid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (SQLException ex) {
            throw new Exception("Veritabani Hatasi = " + ex.getMessage());
        }
        return status != 0;
    }


     public int follow(int followid,int followbyid) throws Exception{
        int i = 0;
        try{
            String query = "insert into follow(followuser,followby) values(?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,followid);
            ps.setInt(2,followbyid);
            int rs = ps.executeUpdate();
            i = rs;
        }catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }

    public int unfollow(int followid,int followbyid) throws Exception{
        int res = 0; 
        try{
            String query = "delete from follow where followuser=? and followby=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,followid);
            ps.setInt(2,followbyid);
            res = ps.executeUpdate();
        } catch (SQLException ex) {
            throw new Exception("Error " + ex.getMessage());
        }
        return res;
    }

    public String getPassword(String email) throws Exception {
        String password = "";
        try {
            String sql = "select password from user where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                password = rs.getString("password");
            }
        } catch (SQLException ex) {
            throw new Exception("Error  = " + ex.getMessage());
        }
        return password;
    }


}