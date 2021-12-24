package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import dao.UserDao;
import models.User;
import dao.PostDao;
import models.Like;

public class FollowUserController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Hello world");
        String postid = "";
        String follow = request.getParameter("followuser");
        String followbyid = request.getParameter("followby");
        if(request.getParameter("postid") != null){
            postid = request.getParameter("postid");
        }
        UserDao userDao= new UserDao();
        try{
            int status = userDao.follow(Integer.parseInt(follow),Integer.parseInt(followbyid));
            if(postid != "" && postid != null )
                response.sendRedirect("single-post?blogid="+postid);
            else
                response.sendRedirect("user-profile?userid="+follow);
        }catch(Exception ex){
            out.println(ex.getMessage());
            
        }
            
    }
       
}
