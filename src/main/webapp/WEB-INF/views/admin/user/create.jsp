<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                <h3>Create a user</h3>
                    <form:form method="post"
                    action="/admin/user/create"
                    modeAttribute="newUser">
                      <div class="mb-3">
                        <form:label for="email" path="email" class="form-label">Email address</form:label>
                        <form:input type="email" path="email" class="form-control" id="email" aria-describedby="emailHelp">
                      </div>
                      <div class="mb-3">
                        <form:label for="password" path="password" class="form-label">Password</form:label>
                        <form:input type="password" path="password" class="form-control" id="password"/>
                      </div>
                      <div class="mb-3">
                        <form:label for="phone" path="phone" class="form-label">Phone number:</form:label>
                        <form:input type="text" path="phone" class="form-control" id="phone"/>
                      </div>
                      <div class="mb-3">
                        <form:label for="fullName" path="fullName" class="form-label">Full Name:</form:label>
                        <form:input type="text" path="fullName" class="form-control" id="fullName"/>
                      </div>
                      <div class="mb-3">
                        <form:label for="address" path="address" class="form-label">Address:</form:label>
                        <form:input type="text" path="address" class="form-control" id="address"/>
                      </div>
                      <button type="submit" class="btn btn-primary">Submit</button>
                    </form:form>
                </div>

            </div>
        </body>

        </html>