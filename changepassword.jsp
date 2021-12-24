
  <%@include file="navbar.jsp" %>
<%  
if(session.getAttribute("logged_in") == null){ 
response.sendRedirect("login.jsp");
}
%> 
  <script>
      function checkPass(){
        var old = document.cp.old.value;
        var pass1 = document.cp.password1.value;
        var pass2 = document.cp.password2.value;
        if(old.trim() == ""|| old.length < 8){
            document.getElementById("span_old_password").innerHTML="Required(Must be 8 digit or Greater)";
            return false;
        }else{
            document.getElementById("span_old_password").innerHTML="";
        }
        if(pass1.trim() == "" || pass1.length < 8){
            document.getElementById("span_password1").innerHTML="Required(Must be 8 digit or Greater)";
            return false;
        }else{
            document.getElementById("span_password1").innerHTML="";
        }

        if(pass2.trim() == "" || pass2.length < 8){
            document.getElementById("span_password2").innerHTML="Required(Must be 8 digit or Greater)";
            return false;
        }else{
            document.getElementById("span_password2").innerHTML="";
        }
        if(pass1 != pass2){
            document.getElementById("span_password2").innerHTML="Password & Confirm Password Not Matched"
            return false;
        }else{
            document.getElementById("span_password2").innerHTML="";
        }
        return true;
    }

  </script>
                
                
  
    <div class="main-content">
    <div class="container mt-5 pb-5 " >
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary border-0 mb-0">
            <div class="card-header pb-1 bg-primary" >
              <div class="text-muted text-center mt-2 mb-3"><h1>Change Password <c:out value="${pass}"/></small></div>
            </div>
            <div class="card-body px-lg-5 py-lg-5 bg-dark">
              <form role="form" action="" method="post" name="cp" onsubmit="return checkPass()" >
                <input type="hidden" name="userid" value="${user.userid}">
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control text-dark " placeholder="Enter Old Password" type="password" name="old">
                  </div>
                  <span class="text-danger bg-dark " id="span_old_password" ></span>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control text-dark" placeholder="Enter New Password" type="password" name="password1">
                  </div>
                  <span class="text-danger  bg-dark" id="span_password1" ></span>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Enter New Password" type="password" name="password2" >
                  </div>
                  <span class="text-danger  bg-dark" id="span_password2" ></span>
                </div>
                <div class="text-center">
                    <% if(request.getParameter("userid")!=null){%>
                    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/> 
                    <sql:query dataSource = "${snapshot}" var = "password" >select password from user where userid = ${param.userid} </sql:query>
                    <c:forEach var="row" items="${password.rows}" ><c:set var="pass" value="${row}"/></c:forEach> 
                    <c:set var="mypass" value="${param.old}"/>
                    <c:if test="${pass.password != mypass}">
                        <span class="h2 text-danger text-center">Old Password is Wrong</span>
                    </c:if>
                    <c:if test="${pass.password == mypass}">
                        <sql:update dataSource = "${snapshot}" var = "count" >update user set password='${param.password1}' where userid=${param.userid} </sql:update>
                        <span class="h2 text-success text-center">Password Changed Successfully!!</span>
                    </c:if>
                    <%  
                        }
                    %>        
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary my-4">Change</button>
                </div>
                <% if (request.getAttribute("form_message") != null) { %>
                  <div class="text-center">
                    <span class="text-white bg-dark" style="font-weight: bold;">*<%= request.getAttribute("form_message") %>*</span>
                  </div>
                <% }%>
              </form>
            </div>
          </div>
          
        </div>
      </div>
    </div>
  </div>
  <!-- Footer -->
 <%@include file="footer.html" %>