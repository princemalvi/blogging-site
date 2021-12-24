package dao;
import java.util.*;
import java.sql.*;
import models.User;
import models.Post;
import db.Database;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;   

public class PostDao{
    Connection con;
    public PostDao(){
        Database db = new Database();
        try{
            con = db.connect();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    // public Post find(int id ) throws Exception{
    //     Post post = new Post();
    //     try{
    //         String query = "select  * from blogs where blogid=? ";
    //         PreparedStatement ps = con.prepareStatement(query);
    //         ps.setInt(1,id);
    //         ResultSet rs = ps.executeQuery();
    //         if(rs.next()){
    //             user.setUserid(rs.getInt("userid"));
    //             user.setName(rs.getString("username"));
    //             user.setEmail(rs.getString("email"));
    //             user.setProfile(rs.getString("profile"));
    //             return user;
    //         }

    //     }catch(Exception e){
    //         e.printStackTrace();
    //     }
    //     return null;
    // }

    public List<Post> listAll(int id) throws Exception{

        try{
            ArrayList<Integer> ids = new ArrayList<>();
            List<Post> postList = new ArrayList<>();
            int size = 0;
            String query = "select b.*,u.username,f.* from blogs b,user u,follow f where u.userid = b.userid and b.status=1 and f.followuser = b.userid and b.userid = ? order by b.posteddate desc";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Post post = new Post();
                ids.add(rs.getInt("blogid"));
                post.setBlogid(rs.getInt("blogid"));
                post.setTitle(rs.getString("title"));
                post.setCategory(rs.getString("category"));
                post.setBlog(rs.getString("blog"));
                post.setPostedById(rs.getInt("userid"));
                post.setPostedByName(rs.getString("username"));
                post.setPosteddate(rs.getString("posteddate"));
                postList.add(post);
                System.out.println("Counter");
            }
            String query2 = "select b.*,u.username from blogs b,user u where u.userid = b.userid and b.status=1 order by b.posteddate desc";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ResultSet rs2 = ps2.executeQuery();        
            while(rs2.next()){
                    for(int i : ids ){
                        if(i == rs2.getInt("blogid")){
                            continue;
                        }
                    }
                    System.out.println("Second Counter");
                    Post post = new Post();
                    post.setBlogid(rs2.getInt("blogid"));
                    post.setTitle(rs2.getString("title"));
                    post.setCategory(rs2.getString("category"));
                    post.setBlog(rs2.getString("blog"));
                    post.setPostedById(rs2.getInt("userid"));
                    post.setPostedByName(rs2.getString("username"));
                    post.setPosteddate(rs2.getString("posteddate"));
                    postList.add(post);
            }
            return postList;
        } catch (SQLException ex) {
            throw new Exception("Error " + ex.getMessage());
        }
    }

     public List<Post> userBlogs(int id) throws Exception{
         List<Post> postList = new ArrayList<>();
         DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();  
        try {
            String sql = "select b.*,u.username,u.profile from blogs b,user u where b.userid=? and b.userid=u.userid  order by b.posteddate desc";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            System.out.println(rs);
            while(rs.next()) {
              
                Post post = new Post();
                
                post.setBlogid(rs.getInt("blogid"));
                post.setTitle(rs.getString("title"));
                post.setCategory(rs.getString("category"));
                post.setBlog(rs.getString("blog"));
                post.setPostedById(rs.getInt("userid"));
                post.setPostedByName(rs.getString("username"));
                post.setStatus(rs.getString("status"));
                post.setProfile(rs.getString("profile"));
                System.out.print(post);
                postList.add(post);
            }            
            return postList;
        } catch (SQLException ex) {
            throw new Exception(ex.getMessage());
        }
    }


     public boolean save(Post post) throws Exception{
        int res = 0; 
        try{
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();
            String query = "insert into blogs(title,category,blog,userid,posteddate) values(?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,post.getTitle());
            ps.setString(2,post.getCategory());
            ps.setString(3,post.getBlog());
            ps.setInt(4,post.getPostedById());
            ps.setString(5,dtf.format(now));
            System.out.println("Update Queery = " +query);
            res = ps.executeUpdate();
        } catch (SQLException ex) {
            throw new Exception("Error " + ex.getMessage());
        }
        return res != 0;
    }


     public Post getSingleBlog(int id ) throws Exception{
        Post post = new Post();
        try{
            String query = "select  b.*,u.username,u.profile from blogs b,user u where blogid=? and b.userid=u.userid";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                post.setBlogid(rs.getInt("blogid"));
                post.setTitle(rs.getString("title"));
                post.setCategory(rs.getString("category"));
                post.setBlog(rs.getString("blog"));
                post.setPostedById(rs.getInt("userid"));
                post.setProfile(rs.getString("profile"));
                post.setPostedByName(rs.getString("username"));
                
                post.setPosteddate(rs.getString("posteddate"));
                return post;
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }



    public boolean delete(int id) throws Exception{
        int res = 0; 
        try{
            String query = "delete from blogs where blogid=?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            res = ps.executeUpdate();
        } catch (SQLException ex) {
            throw new Exception("Error " + ex.getMessage());
        }
        return res != 0;
    }



    public int addLike(int postid,int userid) throws Exception{
        int i = 0;
        try{
            String query = "insert into likes(blogid,userid) values(?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,postid);
            ps.setInt(2,userid);
            int rs = ps.executeUpdate();
            i = rs;
        }catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }

    public int deleteLike(int postid,int userid) throws Exception{
        int res = 0; 
        try{
            String query = "delete from likes where blogid=? and userid=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,postid);
            ps.setInt(2,userid);
            res = ps.executeUpdate();
        } catch (SQLException ex) {
            throw new Exception("Error " + ex.getMessage());
        }
        return res;
    }


}