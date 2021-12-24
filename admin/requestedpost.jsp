<%@include file="header.jsp"%> 


<div style="margin: 10px;">
   <form  action="" method ="get" class="navbar-search navbar-search-dark form-inline mr-sm-3" id="navbar-search-main">
        <select name="status" id="" class="form-control bg-dark form-control-sm">
            <option value="all">ALL</option>
            <option value="pending">Pending</option>
            <option value="approved">Approved</option>
            <option value="rejected">Rejected</option>
        </select>
        <input type="submit" value="Submit" class="btn btn-sm btn-primary ml-2">
    </form>
</div>

<div class="" >
    <div class="row">
        <div class="col-lg-12 " >
            <table class="table table-striped bg-light ">
                <thead>
                  <tr>
                    <th scope="col">Postid</th>
                    <th scope="col">Post Title</th>
                    <th scope="col">Post By</th>
                    <th scope="col">POst Date</th>
                    <th scope="col">Post Desc</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/freeblogger" user = "root"  password = ""/>
                    
    
                    
                    <c:choose>
                        <c:when test="${param.status == 'approved'}" >
                            <sql:query dataSource = "${snapshot}" var = "posts" >select b.*,u.username from blogs b,user u where u.userid = b.userid and b.status = 1</sql:query>
                        </c:when>
                        <c:when test="${param.status == 'pending'}" >
                            <sql:query dataSource = "${snapshot}" var = "posts" >select b.*,u.username from blogs b,user u where u.userid = b.userid and b.status = 0</sql:query>
                        </c:when>
                        <c:when test="${param.status == 'rejected'}" >
                            <sql:query dataSource = "${snapshot}" var = "posts" >select b.*,u.username from blogs b,user u where u.userid = b.userid and b.status = 2</sql:query>
                        </c:when>
                        <c:otherwise>
                            <sql:query dataSource = "${snapshot}" var = "posts" >select b.*,u.username from blogs b,user u where u.userid = b.userid</sql:query>
                        </c:otherwise>
                    </c:choose>  
                    <c:forEach var="post" items="${posts.rows}" >
                        <tr>
                            <th scope="row">${post.blogid}</th>
                            <td>${post.title}</td>
                            <td>${post.username}</td>
                            <td>${post.posteddate}</td>
                            <td >${fn:substring(post.blog,0,20)}</td>
                            <td><a href="view-post?blogid=${post.blogid}" target="_blank" class="btn btn-sm btn-primary">View</a></td>
                            <c:if test="${post.status == 0}" >
                                <td><a href="approve-post?blogid=${post.blogid}" class="btn btn-sm btn-secondary">Approve</a></td>
                                <td><a href="reject-post?blogid=${post.blogid}" class="btn btn-sm btn-danger">Reject </a></td>
                            </c:if>
                            <c:if test="${post.status == 1}" >
                                <td><button class="btn btn-sm btn-success" disabled>Approved</button></td>
                            </c:if>
                            <c:if test="${post.status == 2}" >
                                <td><button class="btn btn-sm btn-danger" disabled >Rejected</button></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    
    <!-- Footer -->

<%@include file="footer.jsp"%> 