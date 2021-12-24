<%@page import="models.Post"%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%@ include file="navbar.jsp" %>


<div style="margin-top:7rem;">
<%  
  if(request.getAttribute("form_message") != null){ 
    out.println(request.getAttribute("form_message")); 
  }
%> 
 
  
    <div align="center" style="display: block;justify-content: center;"> 
      
        <div class="row p-auto">   
          <div class="col-sm-8 center">
            <div class="card text-left">
              <div class="card-body  ">
                <div class="row " style="text-align:justify">  
                  <div class="col-lg-12">
                      <h2> Post id : ${single_post.getBlogid()}</h2>
                      <h2 class="card-title">${single_post.getTitle()}</h2>
                      <h3 class="card-text">Category : ${single_post.getCategory()}</h3>
                      <p class="card-text">
                        ${single_post.getBlog()}
                      </p>
                  </div>
                </div>
            </div>
          </div>
        </div>
            
    </div>
</div>


<%@include file="footer.jsp" %>