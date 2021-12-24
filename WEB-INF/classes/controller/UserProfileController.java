package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import dao.UserDao;
import models.User;
import dao.PostDao;
import models.Like;

public class UserProfileController extends HttpServlet 
{  
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        String userid = request.getParameter("userid");
        User user = new User();
        UserDao userDao= new UserDao();
        try{
            user = userDao.find(Integer.parseInt(userid));
            request.getSession().setAttribute("profile_user",user);
            response.sendRedirect("userprofile.jsp");

        }catch(Exception ex){
             System.out.println(ex.getMessage());
            
        }
            
    }
       
}
