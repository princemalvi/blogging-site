
<%@include file="header.jsp" %> 
  
  
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/> 
<sql:query dataSource = "${snapshot}" var = "posts" >select count(userid) as total from user where date_format(dateregistered,'%Y-%m-%d') = curdate() </sql:query>
<c:forEach var="row" items="${posts.rows}" ><c:set var="todayUser" value="${row}"/></c:forEach> 
<sql:query dataSource = "${snapshot}" var = "posts" >select count(blogid) as total from blogs where date_format(posteddate,'%Y-%m-%d') = curdate() </sql:query>
<c:forEach var="row" items="${posts.rows}" ><c:set var="todayPost" value="${row}"/></c:forEach> 
<sql:query dataSource = "${snapshot}" var = "posts" >select count(userid) as total from user </sql:query>
<c:forEach var="row" items="${posts.rows}" ><c:set var="totalUser" value="${row}"/></c:forEach> 
<sql:query dataSource = "${snapshot}" var = "posts" >select count(blogid) as total from blogs </sql:query>
<c:forEach var="row" items="${posts.rows}" ><c:set var="totalPost" value="${row}"/></c:forEach> 

<div class="header pb-6"  >
      <div class="container-fluid" style="background-color: #f8f9fe;">
        <div class="header-body">
          <div class="row align-items-center py-4">
          </div>
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-3 col-md-6">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Today New <br>User</h5>
                      <span class="h2 font-weight-bold mb-0">${todayUser.total}</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
                        <i class="ni ni-active-40"></i>
                      </div>
                    </div>
                  </div>
                
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Today New <br>Posts</h5>
                      <span class="h2 font-weight-bold mb-0">${todayPost.total}</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                        <i class="ni ni-chart-pie-35"></i>
                      </div>
                    </div>
                  </div>
                 
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Total <br>  Users</h5>
                      <span class="h2 font-weight-bold mb-0">${totalUser.total}</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-green text-white rounded-circle shadow">
                        <i class="ni ni-money-coins"></i>
                      </div>
                    </div>
                  </div>
                 
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6">
              <div class="card card-stats">
                <!-- Card body -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Total <br> Posts</h5>
                      <span class="h2 font-weight-bold mb-0">${totalPost.total}</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-info text-white rounded-circle shadow">
                        <i class="ni ni-chart-bar-32"></i>
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
    <!-- Page content -->
    <div class="container-fluid mt--6" style="background-color: #f8f9fe;">
     
    
      <div class="row">
        <div class="col-xl-6">
          <div class="card-header border-0  bg-default">
            <div class="row align-items-center">
              <div class="col">
                <h3 class="mb-0 text-white">Today's User</h3>
              </div>
              <div class="col text-right">
                <a href="alluser.jsp" class="btn btn-sm btn-primary">See all</a>
              </div>
            </div>
          </div>
          <table class="table table-striped bg-default text-white" >
            <thead>
              <tr>
                <th scope="col">Profile </th>
                <th scope="col">Username</th>
                <th scope="col">Email</th>
              </tr>
            </thead>
            <tbody>
                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
                <sql:query dataSource = "${snapshot}" var = "users" >select * from user where date_format(dateregistered,'%Y-%m-%d') = curdate()</sql:query>    
                 
                
                <c:forEach var="user" items="${users.rows}" >
                    <tr>
                        <td>    
                            <c:choose>
                            <c:when test="${user.profile != '' && user.profile!=null }" >
                              <img  class=" img-responsive ml-2" src="../profile/${user.profile}" id="profileimage" height="50px" width="50px" style="border-radius: 50%;" > 
                            </c:when>
                            <c:otherwise>
                              <img  class="img-responsive ml-2" src="../profile/default.jpg" id="profileimage" height="50px" width="50px" style="border-radius: 50%;" > 
                            </c:otherwise>
                          </c:choose>  
                        </td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
        <div class="col-xl-6">
          <div class="card-header border-0  bg-default">
            <div class="row align-items-center">
              <div class="col">
                <h3 class="mb-0 text-white">Today's Post</h3>
              </div>
              <div class="col text-right">
                <a href="postbytitle.jsp" class="btn btn-sm btn-primary">See all</a>
              </div>
            </div>
          </div>
          <table class="table table-striped bg-default text-white" >
            <thead>
              <tr>
                <th scope="col">Title </th>
                <th scope="col">Category</th>
                <th scope="col">Short Desc</th>
              </tr>
            </thead>
            <tbody>
                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
                <sql:query dataSource = "${snapshot}" var = "posts" >select * from blogs where date_format(posteddate,'%Y-%m-%d') = curdate()</sql:query>    
                 
                
                <c:forEach var="post" items="${posts.rows}" >
                    <tr>
                        <td>${post.title}</td>
                        <td>${post.category}</td>
                        <td>${fn:substring(post.blog,0,20)}...</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
      </div>
      <!-- Footer -->

<%@include file="footer.jsp" %> 
