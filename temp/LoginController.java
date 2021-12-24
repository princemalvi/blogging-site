package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

import dao.UserDao;
import models.User;
public class LoginController extends HttpServlet 
{  
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserDao userDao = new UserDao();
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        try{
            User user = userDao.login(username,password);
            if(user != null){
                System.out.println("Not null");
                session.setAttribute("user", user);
                session.setAttribute("logged_in", true);
                response.sendRedirect("welcome.jsp");
            }else{
                System.out.println("Null");
                request.setAttribute("form_message", "Username or password is wrong!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        }catch(Exception ex){
            request.setAttribute("form_message", ex.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        }
            
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        // if(session.getAttribute("logging_in") != null){
        //     response.sendRedirect("register.jsp");
        // }else{
            response.sendRedirect("login.jsp");
        // }       
    }
    
}
