
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%
if (session.getAttribute("logged_in") != null ){
  response.sendRedirect("welcome.jsp");
}
%>
<%@include file="navbar.jsp" %> 
  <div class="main-content">
    <div class="container mt-8 pb-5 " >
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary border-0 mb-0">
            <div class="card-header pb-1 bg-primary" >
              <div class="text-muted text-center mt-2 mb-3"><h1>Admin Login</small></div>
            </div>
            <div class="card-body px-lg-5 py-lg-5 bg-dark">
              <form role="form" action="admin-login" method="post" name="loginform" onsubmit="return validateFields();">
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control text-dark text0-" placeholder="Email" type="email" name="email">
                  </div>
                  <span class="text-white bg-dark" id="span_email" ></span>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Password" type="password" name="password" >
                  </div>
                  <span class="text-white bg-dark" id="span_password" ></span>
                </div>
              
                <div class="text-center">
                  <button type="submit" class="btn btn-primary my-4">Sign in</button>
                </div>
                <% if (request.getAttribute("form_message") != null) { %>
                  <div class="text-center">
                    <span class="text-white bg-dark" style="font-weight: bold;">*<%= request.getAttribute("form_message") %>*</span>
                  </div>
                <% }%>
              
                <% if(request.getParameter("logout") != "1" && request.getParameter("logout") != null ){ %>
                  <div class="text-center">
                    <span class="text-white bg-dark" style="font-weight: bold;">*You Are Logged Out!!!*</span>
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
 <%@include file="footer.jsp" %>