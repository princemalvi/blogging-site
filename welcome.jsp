
<%@ include file="navbar.jsp" %>

<%@page import="models.Post"%>
<%@page import="models.User"%>

<%  
if(session.getAttribute("logged_in") == null){ 
response.sendRedirect("login.jsp");
}
%> 
<style>
@media only screen and ( max-width: 600px) {
  #sideuser{
    display: none;
  }
}
</style>

<div style="margin-top:1rem;margin-left: 2rem; margin-bottom: 10px;" class="table-responsive">
  <form  action="" method ="get" class="navbar-search navbar-search-dark form-inline mr-sm-3" id="navbar-search-main">
     <div class="form-group mb-0">
       <div class="input-group input-group-alternative input-group-merge">
         <div class="input-group-prepend">
           <span class="input-group-text"><i class="fas fa-search"></i></span>
         </div>
         <input class="form-control" placeholder="Search By  Name or Email" name="text" type="text" class="search-user" >
       </div>
     </div>
   </form>
</div>
    
    <div class="container-fluid ">
      <div class="row">
        <div class="col-lg-8">
          <div class="col-lg-12">
            <% 
              if(request.getParameter("text") == null){
            %>
            <c:forEach var="post" items="${all_post_list}">
              <c:if test="${post.getPostedById() != user.userid}">
                <div class="row">   
                    <div class="col-sm-12 center">
                      <div class="card text-left">
                        <div class="card-body ">
                          <div class="row">
                            <div class="col-lg-9">
                              <input type="hidden" name="user" value="${user.userid}" />
                              <h5 class="card-title text-dark" style="font-size:2rem;font-weight: bold">Title : ${post.getTitle()} </h5>
                              <p class="card-text text-dark" style="font-size:1rem;font-weight: bold; ">Category : ${post.getCategory()}</p>
                              <p class="card-text ">${fn:substring(post.getBlog(),0, 30)}...................</p>
                              <p class="mt-3 font-weight-bolder">Posted BY : ${fn:substring(post.getPostedByName(),0,10)}</p>
                            </div>
                            <div class="col-lg-3 mt-3">
                              <a href="single-post?blogid=${post.getBlogid()}" class="btn btn-primary">Read More</a><br>
                              <p class="mt-3 font-weight-bolder">Posted Date : ${fn:substring(post.getPosteddate(),0,10)}</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </c:if>  
            </c:forEach>
            <% }else{ %>
              <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
              <sql:query dataSource = "${snapshot}" var = "users" >select b.*,u.username from blogs b,user u where u.userid = b.userid and b.status = 1 and (u.username like '${param.text}%' or b.title like '${param.text}%') </sql:query>    
              <c:forEach var="post" items="${users.rows}">
                <c:if test="${post.userid != user.userid}">
                  <div class="row">   
                      <div class="col-sm-12 center">
                        <div class="card text-left">
                          <div class="card-body ">
                            <div class="row">
                              <div class="col-lg-9">
                                <input type="hidden" name="user" value="${user.userid}" />
                                <h5 class="card-title text-dark" style="font-size:2rem;font-weight: bold">Title : ${post.title} </h5>
                                <p class="card-text text-dark" style="font-size:1rem;font-weight: bold; ">Category : ${post.category}</p>
                                <p class="card-text ">${fn:substring(post.blog,0, 30)}...................</p>
                                <p class="mt-3 font-weight-bolder">Posted BY : ${fn:substring(post.username,0,10)}</p>
                              </div>
                              <div class="col-lg-3 mt-3">
                                <a href="single-post?blogid=${post.blogid}" class="btn btn-primary">Read More</a><br>
                                <p class="mt-3 font-weight-bolder">Posted Date : ${fn:substring(post.posteddate,0,10)}</p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </c:if>  
              </c:forEach>

            <% }%>
            

          </div>
        </div>
        


          <div class="col-xl-4 " id="sideuser" >
          <div class="col-md-9 mr-2" style="position: relative;">
            <div class="form-group">
                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger"
                  user = "root"  password = ""/>
                <sql:query dataSource = "${snapshot}" var = "result" >select * from user limit 5</sql:query>
                <c:forEach var = "row" items = "${result.rows}">
                  <c:if test="${row.userid != user.userid}" >
                        
                    <div class="card col-10">
                      <div class="card-body" >
                        <div class="row">
                            <c:choose>
                              <c:when test="${row.profile == null || row.profile==''}" >
                                <img  class=" img-responsive ml-2"src="profile/default.jpg" height="50px" width="50px" style="border-radius: 50%;" > 
                              </c:when>
                              <c:otherwise>
                                <img  class=" img-responsive ml-2"src="profile/${row.profile}" height="50px" width="50px" style="border-radius: 50%;" > 
                              </c:otherwise>
                            </c:choose>  
                          <!-- <img class="text-left rounded-circle col-lg-2" src="assets/img/theme/img-1-1000x600.jpg" alt="Card image cap" >  -->
                          <h3 class="card-title pt-1 offset-1 ">${row.username}</h3>
                        </div>
                        <div class="row pt-2 px-2">
                            <a href="user-profile?userid=${row.userid}" class="btn btn-info">View Profile</a>
                        </div>
                      </div>
                    </div>
                </c:if>
              </c:forEach>
              </div>
          </div>
        </div>
      </div>
    </div>

  

<%@ include file="footer.html" %>