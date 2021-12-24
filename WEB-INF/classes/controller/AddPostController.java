package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 

import dao.PostDao;
import models.User;
import models.Post;

public class AddPostController extends HttpServlet 
{  
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        String title = request.getParameter("title");
        // String blogphoto = request.getParameter("blogphoto");
        String category = request.getParameter("category");
        String blog = request.getParameter("blog");
        String userid = request.getParameter("userid");
       PostDao postDao = new PostDao();
        try{
            Post post = new Post();
            post.setTitle(title);
            post.setCategory(category);
            post.setBlog(blog);
            post.setPostedById(Integer.parseInt(userid));
            
            boolean res = postDao.save(post);
            if (res) {
                response.sendRedirect("my-post?userid="+userid);
            } else {
                request.setAttribute("form_message", "Blog Not Posted");
                request.getRequestDispatcher("write.jsp").forward(request, response);
            }
            
        }catch(Exception ex){
            request.setAttribute("form_message", ex.getMessage());
            request.getRequestDispatcher("writeblog.jsp").forward(request, response);
            
        }
            
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.sendRedirect("writeblog.jsp");
    }
}
