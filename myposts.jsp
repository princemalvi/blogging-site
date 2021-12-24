<%@page import="java.util.*"%>
<%@page import="models.Post"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%@ include file="navbar.jsp" %>
<%  
  if(session.getAttribute("logged_in") == null){ 
    response.sendRedirect("login.jsp"); 
  }
%> 

<%  
  if(request.getAttribute("form_message") != null){ 
    out.println(request.getAttribute("form_message")); 
  }
%> 
 
  
    <h1 align="center" class="mt-2"> My Posts <br></h1>
    <div align="center" style="display: block;justify-content: center;"> 
     
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
      <c:forEach var="post" items="${user_posts}">
        <sql:query dataSource = "${snapshot}" var = "likes" >select count(likeid) as total from likes where blogid =  ${post.blogid} </sql:query>
        <c:forEach var="row" items="${likes.rows}" ><c:set var="totalLikes" value="${row}"/></c:forEach>
        <div class="row">   
          <div class="col-sm-10 center">
            <div class="card text-left">
              <div class="card-body ">
                <input type="hidden" name="user" value="${user.userid}" />
                <h5 class="card-title">Title : ${post.title}</h5>
                <p class="card-text">Category : ${post.category}</p>
                <p class="card-text">${post.blog}</p>
                
                <c:if test="${post.status == 0}">
                  <button class="btn btn-primary" disabled >Pending for Approve</button>
                </c:if>
                <c:if test="${post.status == 1}">
                  <button class="btn btn-warning" disabled>${totalLikes.total} Likes</button>
                  <button class="btn btn-success" disabled>Approved </button>
                </c:if>
                <c:if test="${post.status == 2}">
                  <button class="btn btn-warning" disabled>Rejected</button>
                </c:if>
               
                <a href="delete-post?id=${post.blogid}&userid=${user.userid}" class="btn btn-danger">Delete Post</a>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>


<%@include file="footer.html" %>