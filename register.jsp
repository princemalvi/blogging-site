
  <%@include file="navbar.jsp" %>
  
  <div class="main-content">
    <div class="container mt-5 pb-5 " >
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary border-0 mb-0">
            <div class="card-header pb-1 bg-primary" >
              <div class="text-muted text-center mt-2 mb-3"><h1>Sign Up</small></div>
            </div>
            <div class="card-body px-lg-5 py-lg-5 bg-dark">
              <form role="form" action="register" method="post" name="loginform" onsubmit="return validateRegFields();">
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                    </div>
                    <input class="form-control text-dark " placeholder="Username" type="text" name="username">
                  </div>
                  <span class="text-white bg-dark" id="span_username" ></span>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control text-dark" placeholder="Email" type="email" name="email">
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
                  <button type="submit" class="btn btn-primary my-4">Sign Up</button>
                </div>
                <% if (request.getAttribute("form_message") != null) { %>
                  <div class="text-center">
                    <span class="text-white bg-dark" style="font-weight: bold;">*<%= request.getAttribute("form_message") %>*</span>
                  </div>
                <% }%>

              </form>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-6">
            </div>
            <div class="col-6 text-right">
              <a href="login.jsp" class="btn btn-neutral btn-icon bg-info">
                <span class="btn-inner--text text-white">Sign In</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Footer -->
 <%@include file="footer.html" %>