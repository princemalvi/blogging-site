<%@include file="header.jsp"%> 

<div style="margin: 10px;">
   <form  action="" method ="get" class="navbar-search navbar-search-dark form-inline mr-sm-3" id="navbar-search-main">
      <div class="form-group mb-0">
        <div class="input-group input-group-alternative input-group-merge">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-search"></i></span>
          </div>
          <input class="form-control" placeholder="Search By  Name or Email" name="text" type="text" class="search-user" >
        </div>
      </div>
      <div>
        <!-- <a href="javascript:demoFromHTML()" class="button">Run Code</a> -->
      
      </div>
      <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
        <span aria-hidden="true">×</span>
      </button>
    </form>
</div>

<div class="row m-0" id="detail">
    <table class="table table-striped bg-light">
        <thead>
          <tr>
            <th scope="col">Userid </th>
            <th scope="col">Profile </th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Bio </th>
            <th scope="col">Date Joined</th>
          </tr>
        </thead>
        <tbody>
            <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
            
            <% 
              if(request.getParameter("text") != null){
            %>
            <sql:query dataSource = "${snapshot}" var = "users" >select * from user where username like '${param.text}%' or email like '${param.text}%'  </sql:query>    
            <%  }else{  %>
            <sql:query dataSource = "${snapshot}" var = "users" >select * from user</sql:query>    
            <%}%>

            
            <c:forEach var="user" items="${users.rows}" >
                <tr>
                    <th scope="row">${user.userid}</th>
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
                    <td>${user.bio}</td>
                    <td>${user.dateregistered}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
     
</div>

<%@include file="footer.jsp"%> 