
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@ include file="navbar.jsp" %>
<%  
  if(session.getAttribute("logged_in") == null){ 
    response.sendRedirect("login.jsp"); 
  }
%> 
<%@ page import="models.User" %>  

  <!-- Main content -->
  <div class="main-content" id="panel" style="margin-top:1rem;">
    <div class="container-fluid" align="center">
        <% if(request.getAttribute("success") != null){ %>
          <h1> <%= request.getAttribute("form_message") %> </h1>
        <% } else if((String)request.getAttribute("success") == "1"){ %>
          <h1> *Profile Updated Success* </h1>
          
          <% } %>
    </div>


    
    
    
    
    
    
      <div class="container-fluid ">
        <div class="row justify-content-center">
          <div class="col-xl-6 order-xl-2">
            <div class="card card-profile">
              <img src="assets/img/theme/img-1-1000x600.jpg" alt="Image placeholder" class="card-img-top" height="230">
              <div class="row justify-content-center">
                <div class="col-lg-3 order-lg-2">
                  <div class="card-profile-image">
                    <div class="custom-file">  
                      <c:choose>
                        <c:when test="${user.profile != '' && user.profile!=null }" >
                          <img  class=" img-responsive ml-2" src="profile/${user.profile}" id="profileimage" height="150px" width="150px" style="border-radius: 50%;" > 
                        </c:when>
                        <c:otherwise>
                          <img  class="img-responsive ml-2" src="profile/default.jpg" id="profileimage" height="150px" width="150px" style="border-radius: 50%;" > 
                        </c:otherwise>
                      </c:choose>  
                    </div>
                  </div>
                </div>
              </div>
              <form action="updateprofile" method="post" enctype="multipart/form-data">
                <input type="text" value="${user.userid}" name="userid" hidden />
                
                <div>
                  <div class="card-header text-center ">
                    <div class="d-flex  justify-content-center mt-3 ml-3">
                      <!-- <a href="#" class="btn btn-sm btn-info  mr-4 ">Follow </a> -->
                      <input type="file" id="exampleInputFile"  onchange="readURL(this);" name="photo" hidden value="${user.profile}" accept="image/*">  <label for="exampleInputFile" class="btn btn-sm btn-primary  ">Change Profile </label>               
                      <!-- <a href="#" class="btn btn-sm btn-default float-right">Message</a> -->
                    </div>
                  </div>
                 
                              
                  <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/> 
                  <sql:query dataSource = "${snapshot}" var = "posts" >select count(blogid) as total from blogs where userid=${user.userid} </sql:query>
                  <c:forEach var="row" items="${posts.rows}" ><c:set var="totalPosts" value="${row}"/></c:forEach> 
                  
                  <sql:query dataSource = "${snapshot}" var = "follows" >select count(fid) as total from follow where followuser=${user.userid} </sql:query>
                  <c:forEach var="row" items="${follows.rows}" ><c:set var="totalFollows" value="${row}"/></c:forEach>
            
                  <sql:query dataSource = "${snapshot}" var = "following" >select count(fid) as total from follow where followby=${user.userid} </sql:query>
                  <c:forEach var="row" items="${following.rows}" ><c:set var="totalFollowing" value="${row}"/></c:forEach>

                  
                  <sql:query dataSource = "${snapshot}" var = "likes" >select count(likeid) as total from likes where blogid in (select blogid from blogs where userid = ${user.userid})</sql:query>
                  <c:forEach var="row" items="${likes.rows}" ><c:set var="totalLikes" value="${row}"/></c:forEach>
                  
            

                  <div class="card-body pt-0">
                    <div class="row">
                      <div class="col">
                        <div class="card-profile-stats d-flex justify-content-center">
                          <div>
                            <a href="myposts.jsp" class="btn btn-sm btn-danger ">
                              <span class="heading"> ${totalPosts.total} </span>
                              <span class="description text-white">Posts</span>
                            </a>
                          </div>
                          <div>
                            <a href="follower.jsp" class="btn btn-sm btn-success ">
                              <span class="heading">${totalFollows.total}</span>
                              <span class="description text-white">Follower</span>
                            </a>
                          </div>
                          <div>
                            <a href="following.jsp" class="btn btn-sm btn-default">
                              <span class="heading">${totalFollowing.total}</span>
                              <span class="description text-white">Following</span>
                            </a>
                          </div>
                          <div>
                            <a href="myposts.jsp" class="btn btn-sm btn-info">
                              <span class="heading">${totalLikes.total}</span>
                              <span class="description text-white">Likes</span>
                            </a>
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
                            <label class="form-control-label ml-2" for="input-username">Username</label>
                            <input type="text" id="input-username " class="form-control text-dark ml-2" name="username"  value="${user.name}" required>
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <div class="form-group">
                            <label class="form-control-label ml-2" for="input-email">Email</label>
                            <input type="text" id="input-email" class="form-control text-dark ml-2" name="email"  value="${user.email}" readonly>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="col-lg-12">
                          <div class="form-group">
                            <label class="form-control-label ml-2" for="input-bio">Bio</label>
                            <textarea type="text" id="input-bio " class="form-control text-dark ml-2" rows=6 name="bio" >${user.bio}</textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-header text-center">
                    <div class="d-flex justify-content-center">
                      <input type="submit"   class="btn btn-sm btn-primary" value="Update Profile">               
                    </div>
                  </div>
                </div>
              </form>
            </div>    
          </div>
        </div>
      </div> 

    
  <%@include file="footer.html" %>
  