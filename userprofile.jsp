
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@ include file="navbar.jsp" %>
<%  
  if(session.getAttribute("logged_in") == null){ 
    response.sendRedirect("login.jsp"); 
  }
%> 
<%@ page import="models.User" %>  
    
   
      <div class="container-fluid " style="margin-top: 1rem;">
        <div class="row justify-content-center">
          <div class="col-xl-6 order-xl-2">
            <div class="card card-profile">
              <img src="assets/img/theme/img-1-1000x600.jpg" alt="Image placeholder" class="card-img-top" height="230">
              <div class="row justify-content-center">
                <div class="col-lg-3 order-lg-2">
                  <div class="card-profile-image">
                    <div class="custom-file">  
                      <c:choose>
                        <c:when test="${profile_user.profile == '' || profile_user.profile == null }" >
                          <img src="profile/default.jpg" id="profileimage"class="img-responsive mb-2" height="150" width="150" style="border-radius: 50%;" >
                        </c:when>
                        <c:otherwise>
                          <img src="profile/${profile_user.profile}" id="profileimage"class="img-responsive mb-2" height="150" width="150" style="border-radius: 50%;" >
                        </c:otherwise>
                      </c:choose>  
                      </div>
                  </div>
                </div>
              </div>
              
              <div class="card-header text-center ">
                <div class="d-flex  justify-content-center mt-3 ml-3">
                        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
                        <sql:query dataSource = "${snapshot}" var = "followresult" >select count(fid) as total from follow where followby = ${user.userid} and followuser=${profile_user.userid} ;</sql:query>
                        <c:forEach var="row" items="${followresult.rows}" ><c:set var="followCount"  value="${row}"/></c:forEach>
                        <c:choose>
                          <c:when test="${followCount.total == 1}" >
                            <a href="unfollow-user?followby=${user.userid}&followuser=${profile_user.userid}" class="btn m-1 btn-danger"> Unfollow</a><br>
                          </c:when>
                          <c:otherwise>
                            <a href="follow-user?followby=${user.userid}&followuser=${profile_user.userid}" class="btn m-1 btn-primary"> Follow</a><br>
                          </c:otherwise>
                        </c:choose> 
                  <a href="single-user-posts?userid=${profile_user.userid}" class="btn m-1 btn-info">All Posts</a>
                </div>
              </div>


              <div>
                  <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/> 
                  <sql:query dataSource = "${snapshot}" var = "posts" >select count(blogid) as total from blogs where userid=${profile_user.userid} and status = 1</sql:query>
                  <c:forEach var="row" items="${posts.rows}" ><c:set var="totalPosts" value="${row}"/></c:forEach> 
                  
                  <sql:query dataSource = "${snapshot}" var = "follows" >select count(fid) as total from follow where followuser=${profile_user.userid} </sql:query>
                  <c:forEach var="row" items="${follows.rows}" ><c:set var="totalFollows" value="${row}"/></c:forEach>
            
                  <sql:query dataSource = "${snapshot}" var = "following" >select count(fid) as total from follow where followby=${profile_user.userid} </sql:query>
                  <c:forEach var="row" items="${following.rows}" ><c:set var="totalFollowing" value="${row}"/></c:forEach>

                  
                  <sql:query dataSource = "${snapshot}" var = "likes" >select count(likeid) as total from likes where blogid in (select blogid from blogs where userid = ${profile_user.userid})</sql:query>
                  <c:forEach var="row" items="${likes.rows}" ><c:set var="totalLikes" value="${row}"/></c:forEach>
                  



                  <div class="card-body pt-0">
                    <div class="row">
                      <div class="col">
                        <div class="card-profile-stats d-flex justify-content-center">
                          <div>
                            <span class="heading"> ${totalPosts.total} </span>
                            <span class="description">Posts</span>
                          </div>
                          <div>
                            <span class="heading">${totalFollows.total}</span>
                            <span class="description">Follower</span>
                          </div>
                          <div>
                            <span class="heading">${totalFollowing.total}</span>
                            <span class="description">Following</span>
                          </div>
                          <div>
                            <span class="heading">${totalLikes.total}</span>
                            <span class="description">Likes</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
             
                  
                  
                  
                  
                  
                  <div class="card-body pt-0">
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="col-lg-12">
                          <div class="form-group">
                            <label class=" ml-2" for="username">Username</label>
                            <h2 id="name" class=" text-dark ml-2" >${profile_user.name} </h2>  
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <div class="form-group">
                            <label class="ml-2" for="email">Email</label>
                            <h2 id="email" class="text-dark ml-2" name="email">${profile_user.email}</h2>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="col-lg-12">
                          <div class="form-group">
                            <label class="ml-2" for="bio">Bio</label>
                            <h2 id="bio " class=" text-dark ml-2" rows=6   name="bio"  >${profile_user.bio}</textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
            </div>    
          </div>
        </div>
      </div> 

    
  <%@include file="footer.html" %>
  