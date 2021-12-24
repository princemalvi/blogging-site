<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no;">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>FreeBlogger - Share Knowlegde</title>
  
  <!-- Favicon -->
  <link rel="icon" href="assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="assets/vendor/nucleo/css/nucleo.css" type="text/css">


  <link rel="stylesheet" href="assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Argon CSS -->
  <link rel="stylesheet" href="assets/css/argon.css?v=1.2.0" type="text/css">
  <link rel="stylesheet" href="mystyle.css" type="text/css">
  <script src="validation.js" type="text/javascript"></script>
  
</head>

<body class=" bg-white ">

  <nav id="navbar-main" class="navbar navbar-horizontal p-3 navbar-transparent navbar-main navbar-expand-lg " style="position: relative;background-color: #e6edf2;" >
      <div class="container-fluid ">
        <a class="navbar-brand " href="ourstory.jsp">
          <h1 class="text-primary ml-2">FreeBlog.com</h1>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse navbar-custom-collapse collapse " id="navbar-collapse"  >
          <div class="navbar-collapse-header">
            <div class="row">
              <div class="col-6 collapse-brand">
                <a href="ourstory.jsp">
                  <h3 class="text-primary ">FreeBlog.com</h3>
                </a>
              </div>
              <div class="col-6 collapse-close">
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                  <span></span>
                  <span></span>
                </button>
              </div>
            </div>
          </div>
        
          
          <ul class="navbar-nav align-items-lg-center ml-lg-auto font-weight-bold">
            <li class="nav-item ">
              <!-- <form class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
                <div class="form-group mb-0">
                  <div class="input-group input-group-alternative input-group-merge">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-search"></i></span>
                    </div>
                    <input class="form-control" placeholder="Search" type="text">
                  </div>
                </div>
                <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
                  <span aria-hidden="true">×</span>
                </button>
              </form> -->
            </li>
           
            <% if(session.getAttribute("logged_in") == null) {  %>
            <li class="nav-item">
              <a class="nav-link" href="login.jsp">
                <span class="nav-link-inner--text  text-primary">Sign In</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="register.jsp">
                <span class="nav-link-inner--text  text-primary">Sign Up</span>
              </a>
            </li>
            <% } %>
            <% if(session.getAttribute("logged_in") != null) {  %>
            <li class="nav-item">
              <a class="nav-link"  href="welcome.jsp">
                <span class="nav-link-inner--text  text-primary">Home</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="writeblog.jsp">
                <span class="nav-link-inner--text text-primary ">Write</span>
              </a>
            </li>
  
            <li>
              <div class="nav-item">
                <a href="profile.jsp" class="nav-link">
                    <span class="nav-link-inner--text  text-primary">Profile</span>
                </a>
            </li>
            <li>
              <div class="nav-item">
                <a href="my-post?userid=${user.userid}" class="nav-link">
                    <span class="nav-link-inner--text  text-primary">My Posts</span>
                </a>
            </li>
            <li>
              <div class="nav-item">
                <a href="changepassword.jsp" class="nav-link">
                    <span class="nav-link-inner--text  text-primary">Change Password</span>
                </a>
            </li>
            <li class="nav-item">
              <a class="nav-link"  href="logout.jsp" >
                <div class="input-group-prepend" >
                  <span class="input-group-text" style="background-color: transparent;border:none"><i class="ni ni-button-power text-primary"></i></span>
                </div>
                
                <!-- <span class="nav-link-inner--text text-primary" >Logout</sp  an> -->
              </a>
            </li>
          </ul>
           
          <% } %>
        </div>
      </div>
    </nav> 