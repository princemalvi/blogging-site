<%@include file="header.jsp"%> 



<div style="margin: 10px;">
  <form  action="" method ="get" class="navbar-search navbar-search-dark form-inline mr-sm-3" id="navbar-search-main">
     <div class="form-group mb-0">
       <div class="input-group input-group-alternative input-group-merge">
         <div class="input-group-prepend">
           <span class="input-group-text"><i class="fas fa-search"></i></span>
         </div>
         <input class="form-control" placeholder="Search By Title or Name" name="text" type="text" class="search-user" >
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

<div class="row m-0">
<table class="table table-striped bg-light">
    <thead>
      <tr>
        <th scope="col">Blog id </th>
        <th scope="col">Title </th>
        <th scope="col">Category</th>
        <th scope="col">Blog</th>
        <th scope="col">Posted By</th>
        <th scope="col">Posted Date </th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
        
      <% 
        if(request.getParameter("text") != null){
      %>
      <sql:query dataSource = "${snapshot}" var = "posts" >select b.*,u.username from blogs b,user u where u.userid = b.userid and (u.username like '${param.text}%' or b.title like '${param.text}%')</sql:query>
      <%  }else{  %>
        <sql:query dataSource = "${snapshot}" var = "posts" >select b.*,u.username from blogs b,user u where u.userid = b.userid</sql:query>
      <%}%>

        
        <c:forEach var="post" items="${posts.rows}" >
            <tr>
                <th scope="row">${post.blogid}</th>
                <td>${post.title}</td>
                <td>${post.category}</td>
                <td>${fn:substring(post.blog,0,10)}........</td>
                <td>${post.username}</td>
                <td>${fn:substring(post.posteddate,0,10)}</td>
                <td><a href="" class="btn btn-sm btn-primary">View</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
  
      
     
</div>

<%@include file="footer.jsp"%> 