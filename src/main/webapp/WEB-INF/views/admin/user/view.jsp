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
                <div class="mx-auto container mt-4">
                    <div class="row">
                        <h3>View a user</h3>
                        <ul class="list-group">
                            <li class="list-group-item active" aria-current="true">${user.fullName}</li>
                            <li class="list-group-item">Email: </li>
                            <li class="list-group-item">Full Name: </li>
                            <li class="list-group-item">Address: </li>
                            <li class="list-group-item">Phone</li>

                        </ul>
                    </div>

                </div>
            </body>

            </html>