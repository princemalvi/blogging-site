<%@include file="header.jsp"%> 

<script>
  function checkDate(){
    var date1 = document.getElementById("date1").value;
    var date2 = document.getElementById("date2").value;
    console.log(date1);
    console.log(date2);

    if(date1 == ''){
      document.getElementById("edate1").innerHTML = "** Please Select Date **";
      return false;
    }else{
      document.getElementById("edate1").innerHTML = "";
    }
    if(date2 == ''){
      document.getElementById("edate2").innerHTML = "** Please Select Date **";
      return false;
    }else{
      document.getElementById("edate2").innerHTML = "";
    }
    if(date1 > date2){
      document.getElementById("edate2").innerHTML = "Second Date Must Greater than First";
      return false;
    }else{
      document.getElementById("edate2").innerHTML = "";
    }
    return true;
  }

</script>


<div>
  <form style="margin: 10px;" class="row" action="" onsubmit="return checkDate()">
    <div id="date-picker-example" class="col-3 md-form md-outline input-with-post-icon datepicker">
      <input placeholder="Select date" type="date" id="date1" name="date1" class="form-control form-control-sm">
      <label for="date1" class="h4 " >Select Start Date</label>
      <i class="fas fa-calendar input-prefix" tabindex=0></i><br>
      <span id = "edate1" class="text-danger"></span>
    </div>
    <div id="date-picker-example" class="col-3 md-form md-outline input-with-post-icon datepicker">
      <input placeholder="Select date" type="date" id="date2" name="date2" class="form-control form-control-sm">
      <label for="date2" class="h4">Select End Date</label>
      <i class="fas fa-calendar input-prefix" tabindex=0></i><br>
      <span id = "edate2" class="text-danger"></span>
    </div>
    <div>
      <input type="submit" class="btn btn-sm btn-success" value="Click"/>
    </div>
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
        if(request.getParameter("date1") != null && request.getParameter("date2")!=null){
      %>
      <sql:query dataSource = "${snapshot}" var = "posts" >select b.*,u.username from blogs b,user u where u.userid = b.userid and date_format(posteddate,'%Y-%m-%d') >= '${param.date1}' and date_format(posteddate,'%Y-%m-%d') <= '${param.date2}'</sql:query>
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