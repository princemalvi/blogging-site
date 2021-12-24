package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import dao.UserDao;
import models.User;
import dao.PostDao;
import models.Like;

public class PostDisLikeController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        String postid = request.getParameter("postid");
        String userid = request.getParameter("userid");
        PostDao postDao= new PostDao();
        try{
            int status = postDao.deleteLike(Integer.parseInt(postid),Integer.parseInt(userid));
            response.sendRedirect("single-post?blogid="+postid);
        }catch(Exception ex){
             System.out.println(ex.getMessage());
            
        }
            
    }
       
}
