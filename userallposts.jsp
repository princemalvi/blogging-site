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

<div style="margin-top:1rem;">
<%  
  if(request.getAttribute("form_message") != null){ 
    out.println(request.getAttribute("form_message")); 
  }
%> 
 
  
    <div align="center" style="display: block;justify-content: center;"> 
        <c:set var="x" value="0"/>
      <c:forEach var="post" items="${single_user_all_posts}">
      <!-- use for only print 1 time user's post text -->
      <c:if test="${x == 0}">
         <h1>${post.postedByName}'s Posts</h1>
        <c:set var="x" value="1"/>
      </c:if>
      <c:if test="${post.status==1}">
      <div class="row">   
          <div class="col-sm-10 center">
            <div class="card text-left">
              <div class="card-body ">
                <h5 class="card-title">Title : ${post.getTitle()}</h5>
                <p class="card-text">Category : ${post.getCategory()}</p>
                <p class="card-text">${post.getBlog()}</p>
              </div>
            </div>
          </div>
        </div>
      </c:if>
      </c:forEach>
    </div>
</div>


<%@include file="footer.html" %>