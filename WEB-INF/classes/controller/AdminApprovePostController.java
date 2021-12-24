package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 
import java.util.*;
import dao.AdminDao;
import models.User;
import models.Post;

public class AdminApprovePostController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        int blogid = Integer.parseInt(request.getParameter("blogid"));
        AdminDao adminDao = new AdminDao();
        try{
            boolean status = adminDao.approve(blogid);
            if(status){
                response.sendRedirect("requestedpost.jsp");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        // response.sendRedirect("requestedpost.jsp");
            
    }
}
