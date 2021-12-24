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
public class ProfileController extends HttpServlet 
{  


    
    public void init(){
        // path = getServletContext().getInitParameter("file-upload"); 
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException
    {
        String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/")+"profile/";
        HashMap<String,String> map = new HashMap<>();
         UserDao userDao = new UserDao();
        //  System.out.println(request.getPart("photo"));
        if(ServletFileUpload.isMultipartContent(request)){

            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                // System.out.println("multipart = "+multiparts);
                Iterator<FileItem> iter = multiparts.iterator();
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString();
                        // System.out.println("Name "+ name + " value = "+value);
                        map.put(name,value);
                    } else {
                        String name = new File(item.getName()).getName();
                        try{
                        // System.out.print("Name = "+name);
                        // if(name != ""){
                            item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                            map.put("profile",name);
                            // System.out.print("Try Block");
                        // }else{
                        }catch(Exception e){
                            map.put("profile","null");
                            // System.out.print("Catch block");
                        // }
                        }
                    }
                }


                for (String name: map.keySet()) {
                    String key = name.toString();
                    String value = map.get(name).toString();
                    System.out.println(key + " " + value);
                }


                System.out.println("User bio =  "+map.get("bio"));
                User user = userDao.find(Integer.parseInt(map.get("userid")));
                user.setName(map.get("username"));
                user.setBio(map.get("bio"));
                user.setEmail(map.get("email"));
                // if(filename != "" || filename!=null) 
                if(!map.get("profile").equals("null"))
                    user.setProfile(map.get("profile"));
                request.getSession().setAttribute("user", user);
                boolean userEdit = userDao.update(user);
                if (userEdit) {
                    response.sendRedirect("profile.jsp");
                } else {
                    request.setAttribute("form_message", "User couldnt update!");
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                }
               
                request.setAttribute("message", "File Uploaded Successfully");
                System.out.println("File updated successfully");
            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
                System.out.println("File upload failed: "+ex);
            }          

        }else{
            request.setAttribute("message",
                                "Sorry this Servlet only handles file upload request");
            System.out.println("file upload only !");
        }
    }
}



// PrintWriter out = response.getWriter();
//         String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/")+"profile\"";
//         // File  UPLOAD_DIRECTORY = new File("C:\\apache-tomcat-9.0.55\\webapps\\freeblogger\\profile");
//         // String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/")+"profile/";   
//         HashMap<String,String> map = new HashMap<>();
//         UserDao userDao = new UserDao();
//         // System.out.println(request.getPart("photo").getSize());

     
//         if(ServletFileUpload.isMultipartContent(request)){
//             System.out.println("Yes");
//             try {
//                 System.out.println("0............");
                 
//                 List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
//                 System.out.println(multiparts);
//                 Iterator<FileItem> iter = multiparts.iterator();    
//                 while (iter.hasNext()) {
//                     System.out.println("1............");
//                     FileItem item = iter.next();

//                     if (item.isFormField()) {
//                         System.out.println("2............");
//                         String name = item.getFieldName();
//                         String value = item.getString();
//                         System.out.println("Name "+ name + " value = "+value);
//                         map.put(name,value);
//                     } else {
//                         System.out.println("3............");
//                         String name = new File(item.getName()).getName();
//                         item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
//                         System.out.println("FIle name = "+name);
//                         map.put("profile",name);
//                     }
//                 }
//                 User user = userDao.find(Integer.parseInt(map.get("userid")));
//                 user.setName(map.get("username"));
//                 user.setBio(map.get("bio"));
//                 user.setEmail(map.get("email"));
//                 // if(filename != "" || filename!=null) 
//                 user.setProfile(map.get("profile"));
//                 request.getSession().setAttribute("user", user);
//                 boolean userEdit = userDao.update(user);
//                 if (userEdit) {
//                     response.sendRedirect("profile.jsp");
//                 } else {
//                     request.setAttribute("form_message", "User couldnt update!");
//                     request.getRequestDispatcher("profile.jsp").forward(request, response);
//                 }
               
//                 System.out.println("File updated successfully");
            
//             } catch (IOException ex) {
//                 System.out.println(ex.getMessage());
//                 request.setAttribute("message", "File Upload Failed due to " + ex);
//                 System.out.println("File upload failed: "+ex);
//             }          
                    
//             catch (Exception ex) {
//                 System.out.println("Eror " +ex.getMessage());
//                 request.setAttribute("form_message", ex.getMessage());
//                 response.sendRedirect("profile.jsp");
//             }
//         }else{
//             request.setAttribute("message","Sorry this Servlet only handles file upload request");
//             out.println("file upload only !");
//         }


