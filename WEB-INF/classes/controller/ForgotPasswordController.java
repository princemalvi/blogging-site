package controller;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

import dao.UserDao;
import models.User;


//import of mail

 
import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;




public class ForgotPasswordController extends HttpServlet 
{  
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {  
        response.setContentType("text/html");
        String username = request.getParameter("email");
        
        UserDao userDao = new UserDao();
        

        PrintWriter out = response.getWriter();
        try{
                String mypassword = userDao.getPassword(username);
                String host = "smtp.gmail.com";
                String port = "587";
                String mailFrom = "sender@gmail.com";
                String password = "sender_password";
        
                // outgoing message information
                String mailTo = "receiver@gmail.com";
                String subject = "FreeBlog Password Reset";
        
                // message contains HTML markups
                String message = "<i>Greetings! </i><br>";
                message += "<b>Wish you a nice day!</b><br>";
                message += "<font color=red>Your Password is = "+mypassword+"</font>";
        
                HtmlEmailSender mailer = new HtmlEmailSender();
                mailer.sendHtmlEmail(host, port, mailFrom, password, mailTo,subject, message);
                System.out.println("Email sent.");
                response.sendRedirect("forgotpassword.jsp?success=true");
        }catch(Exception ex){
            request.setAttribute("form_message", ex.getMessage());
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            
        }
            
    }
}



 
class HtmlEmailSender {
 
    public void sendHtmlEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message) throws AddressException,
            MessagingException {
 
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host",host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
 
        Session session = Session.getInstance(properties, auth);
 
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
 
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        // set plain text message
        msg.setContent(message, "text/html");
 
        // sends the e-mail
        Transport.send(msg);
 
    }
}
