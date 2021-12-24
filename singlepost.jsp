<%@page import="models.Post"%>

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
      
        <div class="row p-auto">   
          <div class="col-sm-8 center">
            <div class="card text-left">
              <div class="card-body  ">
                  
                
                <div class="row ">  
                  <div class="col-lg-2 my-auto ">
                    <c:choose>
                        <c:when test="${single_post.profile != '' && single_post.profile!=null }" >
                          <img  class=" img-responsive ml-2" src="profile/${single_post.profile}" id="profileimage" height="120px" width="120px" style="border-radius: 50%;" > 
                        </c:when>
                        <c:otherwise>
                          <img  class="img-responsive ml-2" src="profile/default.jpg" id="profileimage" height="120px" width="120px" style="border-radius: 50%;" > 
                        </c:otherwise>
                      </c:choose>  
                  </div>
                  <div class="col-lg-7">
                    <h2 class="m-4">${single_post.getPostedByName()}  </h2>
                    <h2 class="m-4">Posted Date : ${fn:substring(single_post.getPosteddate(),0,10)}</h2>
                  </div>
                  <div class="col-lg-3 ">
                      <div class="row justify-content-center">
                        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
                        <sql:query dataSource = "${snapshot}" var = "followresult" >select count(fid) as total from follow where followby = ${user.userid} and followuser=${single_post.getPostedById()} ;</sql:query>
                        <c:forEach var="row" items="${followresult.rows}" ><c:set var="followCount"  value="${row}"/></c:forEach>
                        <c:choose>
                          <c:when test="${followCount.total == 1}" >
                            <a href="unfollow-user?postid=${single_post.getBlogid()}&followby=${user.userid}&followuser=${single_post.getPostedById()}" class="btn m-1 btn-danger"> Unfollow</a><br>
                          </c:when>
                          <c:otherwise>
                            <a href="follow-user?postid=${single_post.getBlogid()}&followby=${user.userid}&followuser=${single_post.getPostedById()}" class="btn m-1 btn-primary"> Follow</a><br>
                          </c:otherwise>
                        </c:choose> 
                        <sql:query dataSource = "${snapshot}" var = "result" >SELECT count(likeid) as total from likes where userid = ${user.userid} and blogid = ${single_post.getBlogid()}</sql:query>
                        <sql:query dataSource = "${snapshot}" var = "result1" >SELECT count(*) as total from likes where  blogid = ${single_post.getBlogid()}</sql:query>
                        
                        <c:forEach var="row" items="${result.rows}" ><c:set var="counts"  value="${row}"/></c:forEach>
                        <c:forEach var="row" items="${result1.rows}" ><c:set var="likeCount" value="${row}"/></c:forEach>
                        <c:choose>
                          <c:when test="${counts.total == 1}" >
                            <a href="dislike-post?postid=${single_post.getBlogid()}&userid=${user.userid}" class="btn m-1 btn-info  bg-danger" >${likeCount.total} Like</a>
                          </c:when>
                          <c:otherwise>
                            <a href="like-post?postid=${single_post.getBlogid()}&userid=${user.userid}" class="btn m-1 btn-primary" >${likeCount.total}  Like</a>
                          </c:otherwise>
                        </c:choose>  
                      </div>
                      <div class="row justify-content-center">
                        <a href="user-profile?userid=${single_post.getPostedById()}" class="btn m-1 btn-info col-lg-8">View Profile</a><br>
                          
                      </div>
                  </div>
                </div>
                <br>
                <div class="row my-auto mx-auto">  
                  <div class="col-lg-12">
                      <input type="hidden" name="user" value="${user.userid}" />
                      <h2 class="card-title">${single_post.getTitle()} </h2>
                      <h3 class="card-text">Category : ${single_post.getCategory()}</h3>
                      <p class="card-text">
                        ${single_post.getBlog()}
                      </p>
                  </div>
                </div>


                </div>
            </div>
          </div>
        </div>
            
    </div>
</div>


<%@include file="footer.html" %>