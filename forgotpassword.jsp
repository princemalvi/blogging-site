<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@include file="navbar.jsp" %>
  <%  
    if(session.getAttribute("logged_in") != null){ 
    response.sendRedirect("welcome.jsp");
    }
  %> 
  
  <div class="main-content">
    <div class="container mt-5 pb-5 " >
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary border-0 mb-0">
            <div class="card-header pb-1 bg-primary" >
              <div class="text-muted text-center mt-2 mb-3"><h1>Forgot Password</small></div>
            </div>
            <div class="card-body px-lg-5 py-lg-5 bg-dark">
              <form role="form" action="forgotpassword" method="post" name="loginform" onsubmit="return validateFields();">
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control text-dark text0-" placeholder="Email" type="email" name="email">
                  </div>
                  <span class="text-white bg-dark" id="span_email" ></span>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary my-4">Submit</button>
                </div>
               
                <% if(request.getParameter("success") != null){ %>
                  <div class="text-center">
                    <span class="text-white bg-dark" style="font-weight: bold;">*Password Sent to Your Mail*</span>
                  </div>
                <% }%>
              </form>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-12 text-right">
              <a href="login.jsp" class="btn btn-neutral btn-icon bg-info">
                <span class="btn-inner--text text-white">Login</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Footer -->
 <%@include file="footer.html" %>