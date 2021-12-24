package controller;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.http.Part;
import dao.UserDao;
import models.User;


@MultipartConfig(maxFileSize = 169999999)
public class ProfileControllerDemo extends HttpServlet 
{  


    
    public void init(){
        // path = getServletContext().getInitParameter("file-upload"); 
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException
    {
        PrintWriter out = response.getWriter();
        String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/")+"profile";
        // File  UPLOAD_DIRECTORY = new File("C:\\apache-tomcat-9.0.55\\webapps\\freeblogger\\profile");
        // String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/")+"profile/";   
        System.out.println("Upload Directory"+ UPLOAD_DIRECTORY);
        System.out.println("User profile" + request.getParameter("profile"));
        HashMap<String,String> map = new HashMap<>();
        UserDao userDao = new UserDao();
        // System.out.println(request.getPart("photo").getSize());
        if(ServletFileUpload.isMultipartContent(request)){
            System.out.println("Yes");
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                System.out.println(multiparts);
                Iterator<FileItem> iter = multiparts.iterator();    
                while (iter.hasNext()) {
                    System.out.println("1............");
                    FileItem item = iter.next();

                    if (item.isFormField()) {
                        System.out.println("2............");
                        String name = item.getFieldName();
                        String value = item.getString();
                        System.out.println("Name "+ name + " value = "+value);
                        map.put(name,value);
                    } else {
                        System.out.println("3............");
                        String name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                        System.out.println("FIle name = "+name);
                        map.put("profile",name);
                    }
                    User user = userDao.find(Integer.parseInt(map.get("userid")));
                    user.setName(map.get("username"));
                    user.setBio(map.get("bio"));
                    user.setEmail(map.get("email"));
                    // if(filename != "" || filename!=null) 
                    user.setProfile(map.get("profile"));
                    request.getSession().setAttribute("user", user);
                    boolean userEdit = userDao.update(user);
                    if (userEdit) {
                        response.sendRedirect("profile.jsp");
                    } else {
                        request.setAttribute("form_message", "User couldnt update!");
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    }
                
                    System.out.println("File updated successfully");
                
                
                }
                
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
                request.setAttribute("message", "File Upload Failed due to " + ex);
                System.out.println("File upload failed: "+ex);
            }          
                    
            catch (Exception ex) {
                System.out.println("Eror " +ex.getMessage());
                request.setAttribute("form_message", ex.getMessage());
                response.sendRedirect("profile.jsp");
            }
        }else{
            request.setAttribute("message","Sorry this Servlet only handles file upload request");
            out.println("file upload only !");
        }


    }
}
