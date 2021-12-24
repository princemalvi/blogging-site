package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 

import dao.UserDao;
import models.User;
public class RegistrationController extends HttpServlet 
{   
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
       
       UserDao userDao = new UserDao();
        try{
            User user = new User();
            user.setName(username);
            user.setEmail(email);
            user.setPassword(password);
            
            boolean res = userDao.save(user);
            if (res) {
                response.sendRedirect("login.jsp?success=1");
            } else {
                request.setAttribute("form_message", "User couldnt add!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            
        }catch(Exception ex){
            request.setAttribute("form_message", ex.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
            
        }
            
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.sendRedirect("register.jsp");
    }
}
