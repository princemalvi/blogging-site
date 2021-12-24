<%@page import="java.util.*"%>
<%@page import="models.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%@ include file="navbar.jsp" %>
<%  
  if(session.getAttribute("logged_in") == null){ 
    response.sendRedirect("login.jsp"); 
  }
%> 

<%  
  if(request.getAttribute("form_message") != null){ 
    out.println(request.getAttribute("form_message")); 
  }
%> 
<%  
if(request.getParameter("success") != null){ 
    out.println("Post Success"); 
}
%>
<script src="https://cdn.tiny.cloud/1/9cuipmuxg1vg2sz264zbl7zx7t1c7toev2ajy4b64s174i7n/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script> 
  <script>
    tinymce.init({
      selector: 'textarea',
      skin: 'oxide-dark',
      menubar:'edit view format ',
      statusbar:false,
      toolbar: 'undo redo styleselect bold italic alignleft aligncenter alignright bullist numlist outdent indent code',
      setup: function (editor) {
        editor.on('change', function () {
            editor.save();
        });
     }
         
    });
  </script>
<form id="blog-form" method="post" action="addpost"  >
  
    <input type="hidden" name="userid" value="${user.userid}"/>
    <div class="messages"></div>
    <div class="card m-3 col-md-8 center">
        <div class="card-body">
        <div class="controls">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="form_name">Blog Title</label>
                    <input id="form_name" type="text" name="title" class="form-control" placeholder="Enter Blog Title *" required="required" data-error="Firstname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="form_lastname">Category</label>
                    <input id="form_lastname" type="text" name="category" class="form-control" placeholder="Enter Blog Category*" required="required" data-error="Lastname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="form_message">Post Details</label>
                    <pre><textarea id="form_message" name="blog" class="form-control" placeholder="Enter About Post..........." rows="15" required="required" data-error="Please, leave us a message."></textarea></pre>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-12">
                <input type="submit" class="btn btn-danger btn-send" value="Post">
            </div>
        </div>
    </div>
</div>
</div>
</form>
</div>  



<%@include file="footer.html" %>