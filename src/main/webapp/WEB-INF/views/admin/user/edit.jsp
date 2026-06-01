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
                        <h3>Edit a user</h3>
                        <form:form method="post" action="/admin/user/edit" modelAttribute="users">
                            <div class="mb-3" style="display: none;">
                                <label class="form-label">ID</label>
                                <form:input type="text" path="id" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <form:input type="email" path="email" class="form-control" disabled="true" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <form:input type="password" path="password" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phone number:</label>
                                <form:input type="text" path="phone" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Full Name:</label>
                                <form:input type="text" path="fullName" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address:</label>
                                <form:input type="text" path="address" class="form-control" />
                            </div>
                            <div class="d-flex w-full justify-content-between">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <a href="/admin/user" class="btn btn-primary">Back</a>

                            </div>
                        </form:form>
                    </div>

                </div>
            </body>

            </html>