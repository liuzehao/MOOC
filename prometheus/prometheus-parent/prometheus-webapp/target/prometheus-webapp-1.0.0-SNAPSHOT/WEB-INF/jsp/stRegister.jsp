<%--
  Created by IntelliJ IDEA.
  User: hao pc
  Date: 2015/12/2
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="<c:url value="/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>" type="text/javascript"></script>
<head>
    <title></title>
</head>
<body>

<form action="sRegister" method="post">
  <div class="form-group">
    <label for="username">Username</label>
    <input class="form-control" id="username" name="username" placeholder="Username">
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</body>
</html>
