package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 
import java.util.*;
import dao.PostDao;
import models.User;
import models.Post;

public class HomePagePostController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        PostDao postDao = new PostDao();
        try{
            Post post = new Post();
            User user= (User)request.getSession(false).getAttribute("user");
            int id = user.getUserid();
            // System.out.println((User)request.getSession(false).getAttribute("user").getUserid());
            List<Post> post_list = postDao.listAll(id);
            request.getSession().setAttribute("all_post_list", post_list);
        }catch(Exception ex){
            request.getSession().setAttribute("form_message", ex.getMessage());
        }
        response.sendRedirect("welcome.jsp");
            
    }
}
