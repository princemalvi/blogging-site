package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import dao.UserDao;
import models.User;
import dao.PostDao;
import models.Like;

public class UnfollowUserController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        String postid = "";
        String follow = request.getParameter("followuser");
        String followbyid = request.getParameter("followby");
        if(request.getParameter("postid") != null){
            postid = request.getParameter("postid");
        }
        UserDao userDao= new UserDao();
        try{
            int status = userDao.unfollow(Integer.parseInt(follow),Integer.parseInt(followbyid));
            if(postid != null && postid != "" )
                response.sendRedirect("single-post?blogid="+postid);
            else
                response.sendRedirect("user-profile?userid="+follow);        
        }catch(Exception ex){
             System.out.println(ex.getMessage());
            
        }
            
    }
       
}
