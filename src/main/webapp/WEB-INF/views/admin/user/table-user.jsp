<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- <link rel="stylesheet" href="/LICENSE_VI.MD"> -->
                <!-- <link href="${pageContext.request.contextPath}/resources/css/css_bootstrap/bootstrap.min.css"
                rel="stylesheet"> -->

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/demo.css" rel="stylesheet">
                <!-- <script src="${pageContext.request.contextPath}/resources/js/js_bootstrap/bootstrap.bundle.min.js"></script> -->

            </head>

            <body>
                <div class="container mt-4">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <header>
                                <h3>Table User</h3>
                                <a href="/admin/user/create" class="btn btn-primary">Create a User</a>
                            </header>
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Email</th>
                                        <th>Full Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="item" items="${listUsers}">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.email}</td>
                                            <td>${item.fullName}</td>
                                            <td>
                                                <a href="/admin/user/view/${item.id}" class="btn btn-success">View</a>
                                                <a href="#" class="btn btn-warning">Edit</a>
                                                <a href="#" class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <style>
                    header {
                        display: flex;
                        justify-content: space-between;
                        padding-bottom: 10px;
                        margin-bottom: 10px;
                        border-bottom: 1px solid #ccc;
                    }
                </style>
            </body>

            </html>