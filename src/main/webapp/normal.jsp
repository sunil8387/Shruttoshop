<%@page import="com.mycompany.webapp.entities.User"%>
<% 

    User user =(User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in!! Log in first");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user.getUserType().equals("admin")){
            session.setAttribute("message", "You are logged in as admin !!You can't access this page");
            response.sendRedirect("login.jsp");   
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>Normal User!</h1>
    </body>
</html>
