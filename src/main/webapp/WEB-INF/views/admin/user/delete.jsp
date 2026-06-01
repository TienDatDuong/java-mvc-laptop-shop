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
        <div class="d-flex w-full justify-content-between mb-3">
            <h3>Delete user ${id}</h3>
            <a href="/admin/user" class="btn btn-primary">Back</a>
        </div>

        <form:form method="post" action="/admin/user/delete" modelAttribute="users">
            <h3>
                Bạn có chắc chắn muốn xóa
            </h3>
            <div class="mb-3" style="display: none">
                <label class="form-label">Id</label>
                <form:input value="${id}" path="id" type="text" class="form-control"></form:input>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>

    </div>

</div>
</body>

</html>