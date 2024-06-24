<%@page import="com.mycompany.webapp.entities.User"%>
<%
  
       User user2 =(User)session.getAttribute("current-user");
       if(user2!=null){
            response.sendRedirect("index.jsp");
        }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <title>Login Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header">
                            <h3 class="text-center">Sign in Here</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <input type="email" name="email" class="form-control" id="email" placeholder="Email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone</small>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2">If not registered click here!!</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Submit</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
