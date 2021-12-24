package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 
import java.util.*;
import dao.PostDao;
import models.User;
import models.Post;

public class GetAllUserPostController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        int userid = Integer.parseInt(request.getParameter("userid"));
       String page = "";
       PostDao postDao = new PostDao();
        try{
            Post post = new Post();
            
            List<Post> user_posts = postDao.userBlogs(userid);
            System.out.print("Size = " +user_posts.size());
            request.getSession().setAttribute("user_posts", user_posts);
            page = "myposts.jsp";
    
        }catch(Exception ex){
            request.getSession().setAttribute("form_message", ex.getMessage());
            page="myposts.jsp";    
        }
        response.sendRedirect("myposts.jsp");
            
    }
}
