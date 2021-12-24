package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

import dao.AdminDao;
import models.User;
public class AdminLoginController extends HttpServlet 
{  
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        
        AdminDao admin = new AdminDao();
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        try{
            boolean user = admin.login(username,password);
            if(user == true){
                System.out.println("SUccess");
                session.setAttribute("admin", username);
                session.setAttribute("logged_in", true);
                // response.sendRedirect("welcome.jsp");
            }else{
                request.setAttribute("form_message", "Username or password is wrong!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        }catch(Exception ex){
            request.setAttribute("form_message", ex.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        }
        response.sendRedirect("welcome.jsp");
            
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        // if(session.getAttribute("logging_in") != null){
        //     response.sendRedirect("register.jsp");
        // }else{
            response.sendRedirect("/login.jsp");
        // }       
    }
    
}
