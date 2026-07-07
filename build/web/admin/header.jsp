<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="dashboard.jsp">MobileStore Admin</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="phone?action=list">Products</a></li>
                        <li class="nav-item"><a class="nav-link" href="category?action=list">Categories</a></li>
                        <li class="nav-item"><a class="nav-link" href="user?action=list">Users</a></li>
                        <li class="nav-item"><a class="nav-link" href="order?action=list">Orders</a></li>
                    </ul>
                    <div class="d-flex text-light align-items-center">
                        <% User user = (User) session.getAttribute("LOGIN_USER");
                           if (user != null) { %>
                           Welcome, <%= user.getFullName() %> &nbsp;
                           <a href="../logout" class="btn btn-sm btn-outline-light">Logout</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container mt-4">
