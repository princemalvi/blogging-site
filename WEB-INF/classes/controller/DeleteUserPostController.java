package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 
import java.util.*;
import dao.PostDao;
import models.User;
import models.Post;

public class DeleteUserPostController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        int postid = Integer.parseInt(request.getParameter("id"));
        int userid = Integer.parseInt(request.getParameter("userid"));

       String page = "";
       PostDao postDao = new PostDao();
        try{
            boolean status = postDao.delete(postid);
            if(status)
                request.getRequestDispatcher("my-post?userid="+userid).forward(request,response);   
            else{
                request.getRequestDispatcher("my-post?userid="+userid).forward(request, response);
            }
        }catch(Exception ex){
            request.setAttribute("form_message", ex.getMessage());
            request.getRequestDispatcher("myposts.jsp").forward(request, response);
       
        }
            
    }
}
