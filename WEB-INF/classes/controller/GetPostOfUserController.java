package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 
import java.util.*;
import dao.PostDao;
import models.User;
import models.Post;

public class GetPostOfUserController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        int userid = Integer.parseInt(request.getParameter("userid"));
       String page = "";
       PostDao postDao = new PostDao();
        try{
            Post post = new Post();
            List<Post> single_user_all_posts = postDao.userBlogs(userid);
            request.getSession().setAttribute("single_user_all_posts", single_user_all_posts);
            page = "userallposts.jsp";
    
        }catch(Exception ex){
            request.getSession().setAttribute("form_message", ex.getMessage());
            page="userallposts.jsp";    
        }
        response.sendRedirect("userallposts.jsp");
            
    }
}
