
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%
if (session.getAttribute("logged_in") == null ){
  response.sendRedirect("login.jsp");
}
%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
 
  <title>FreeBlog.com - Admin Site</title>
  
  
  <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
  <!-- Favicon -->
  <link rel="icon" href="../assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="../assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="../assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Page plugins -->
  <!-- Argon CSS -->

  <link rel="stylesheet" href="../assets/css/argon.css?v=1.2.0" type="text/css">
  <link rel="stylesheet" href="../mystyle.css" type="text/css">
  <script src="../validation.js" type="text/javascript"></script>
  <script src="jquery.js" type="text/javascript"></script>
  <script src="jspdf.umd.min.js" type="text/javascript"></script>
  <script src="jspdf.plugin.autotable.js" type="text/javascript"></script>


</head>

<body >
  <!-- Sidenav -->
  <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-default " id="sidenav-main">
    <div class="scrollbar-inner">
      <!-- Brand -->
      <div class="sidenav-header  align-items-center">
        <a class="navbar-brand bg-default text-primary" href="javascript:void(0)">
          FreeBlog.com
        </a>
      </div>
      <div class="navbar-inner">
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
          <!-- Nav items -->
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link text-white" href="welcome.jsp">
                <i class="ni ni-tv-2 text-primary"></i>
                <span class="nav-link-text">Home</span>
              </a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link text-white" href="alluser.jsp">
                <i class="ni ni-single-02 text-violet"></i>
                <span class="nav-link-text">Users</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="alluserbydate.jsp">
                <i class="ni ni-collection text-green"></i>
                <span class="nav-link-text">All User By Date</span>
              </a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link text-white" href="requestedpost.jsp">
                <i class="ni ni-check-bold text-primary"></i>
                <span class="nav-link-text">Post For Check</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="postbydate.jsp">
                <i class="ni ni-bullet-list-67 "></i>
                <span class="nav-link-text">Post By Date</span>
              </a>
            </li>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="postbytitle.jsp">
              <i class="ni ni-bullet-list-67 "></i>
              <span class="nav-link-text">Post By Name Or Title</span>
            </a>
          </li>
          </ul>
          <hr class="my-lg-3 ">
        
          <ul class="navbar-nav mb-md-3">
            <li class="nav-item ">
              <a class="nav-link text-white" href="logout.jsp" target="_blank">
                <i class="ni ni-spaceship"></i>
                <span class="nav-link-text">Logout</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
  <!-- Main content -->
  <div class="main-content" id="panel" style="background-color: #f8f9fe;">
    <!-- Topnav -->
    <nav class="navbar navbar-top navbar-expand navbar-dark  border-bottom">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <h1>Hello Admin</h1>
        </div>
        <ul class="navbar-nav align-items-center  ml-md-auto ">
          <li class="nav-item d-xl-none">
            <!-- Sidenav toggler -->
            <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
              <div class="sidenav-toggler-inner">
                <i class="sidenav-toggler-line"></i>
                <i class="sidenav-toggler-line"></i>
                <i class="sidenav-toggler-line"></i>
              </div>
            </div>
          </li>
        </ul>
       
      </div>
    
    </nav>