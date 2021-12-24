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
<div class="row m-0" id="detail">
    <table class="table table-striped bg-light">
        <thead>
          <tr>
            <th scope="col">Userid </th>
            <th scope="col">Profile </th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Bio </th>
            <th scope="col">Date Joined</th>
          </tr>
        </thead>
        <tbody>
            <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
            
         
            <% 
              if(request.getParameter("date1") != null && request.getParameter("date2")!=null){
            %>
            <sql:query dataSource = "${snapshot}" var = "users" >select * from user where dateregistered >= '${param.date1}' and dateregistered <= '${param.date2}'</sql:query>
            <%  }else{  %>
            <sql:query dataSource = "${snapshot}" var = "users" >select * from user</sql:query>    
            <%}%>

            <c:forEach var="user" items="${users.rows}" >
                <tr>
                    <th scope="row">${user.userid}</th>
                    <td>    
                        <c:choose>
                        <c:when test="${user.profile != '' && user.profile!=null }" >
                          <img  class=" img-responsive ml-2" src="../profile/${user.profile}" id="profileimage" height="50px" width="50px" style="border-radius: 50%;" > 
                        </c:when>
                        <c:otherwise>
                          <img  class="img-responsive ml-2" src="../profile/default.jpg" id="profileimage" height="50px" width="50px" style="border-radius: 50%;" > 
                        </c:otherwise>
                      </c:choose>  
                    </td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.bio}</td>
                    <td>${user.dateregistered}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
     
</div>

<%@include file="footer.jsp"%> 