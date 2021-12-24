
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@ include file="navbar.jsp" %>
<%  
  if(session.getAttribute("logged_in") == null){ 
    response.sendRedirect("login.jsp"); 
  }
%> 

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
<sql:query dataSource = "${snapshot}" var = "followers" >select f.*,u.*  from  follow f,user u where f.followuser = u.userid and f.followby=${user.userid}</sql:query>    

    <div class="row mt-2">  
        <c:forEach var="follower" items="${followers.rows}"> 
        <div class="col-sm-6 left">
          <div class="card ">
            <div class="card-body text-center ">
              <div class="row">
                <div class="col-lg-2 text-center">
                    <div class="custom-file">  
                        <c:choose>
                          <c:when test="${follower.profile != '' && follower.profile!=null }" >
                            <img  class=" img-responsive ml-2" src="profile/${follower.profile}" id="profileimage" height="70px" width="70px" style="border-radius: 50%;" > 
                          </c:when>
                          <c:otherwise>
                            <img  class="img-responsive ml-2" src="profile/default.jpg" id="profileimage" height="70px" width="70px" style="border-radius: 50%;" > 
                          </c:otherwise>
                        </c:choose>  
                      </div>
                </div>
                <div class="col-lg-6 text-left">
                    <div>${follower.username}</div>
                    <div>${follower.email}</div>
                </div> 
                <div class="col-lg-4">
                    <a href="user-profile?userid=${follower.userid}" class="btn btn-sm btn-info" >View Profile</a>
                </div>
              </div>
            </div>
          </div>
        </div>
    </c:forEach>
      </div>

<%@ include file="footer.html" %>





