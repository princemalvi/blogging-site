package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 
import java.util.*;
import dao.PostDao;
import models.User;
import models.Post;

public class AdminViewPostController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        int blogid = Integer.parseInt(request.getParameter("blogid"));
        PostDao postDao = new PostDao();
        try{
            Post post = new Post();
            Post single_post = postDao.getSingleBlog(blogid);
            request.getSession().setAttribute("single_post",single_post);
        }catch(Exception ex){
            request.getSession().setAttribute("form_message", ex.getMessage());
        }
        response.sendRedirect("viewpost.jsp");
            
    }
}
