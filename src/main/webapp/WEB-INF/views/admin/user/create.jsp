<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop"/>
    <meta name="author" content="Hỏi Dân IT"/>
    <title>Dashboard - Hỏi Dân IT</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                console.log("imgURL",imgURL);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display": "block"});
            });
        });
    </script>

</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="mx-auto container mt-4">
                <div class="row">
                    <h3>Create a user</h3>
                    <form:form method="post" action="/admin/user/create"
                               modelAttribute="newUser"
                               enctype="multipart/form-data"
                    >
                        <div class="row">
                            <div class="mb-3 col-sm-6">
                                <label for="email" class="form-label">Email</label>
                                <form:input type="email" path="email" class="form-control"
                                            aria-describedby="emailHelp"/>
                            </div>
                            <div class="mb-3 col-sm-6">
                                <label for="password" class="form-label">Password</label>
                                <form:input type="password" path="password" class="form-control"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-6">
                                <label for="phone" class="form-label">Phone number:</label>
                                <form:input type="text" path="phone" class="form-control"/>
                            </div>
                            <div class="mb-3 col-sm-6">
                                <label for="fullName" class="form-label">Full Name:</label>
                                <form:input type="text" path="fullName" class="form-control"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-12">
                                <label for="address" class="form-label">Address:</label>
                                <form:input type="text" path="address" class="form-control"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-6">
                                <label for="address" class="form-label">RoLe:</label>
                                <form:select class="form-select" aria-label="Default select example" path="role.name">
                                    <option value="ADMIN">Admin</option>
                                    <option value="USER">User</option>
                                </form:select>
                            </div>
                            <div class="mb-3 col-sm-6">
                                <label for="address" class="form-label">Avartar:</label>
                                <input type="file" class="form-control" id="avatarFile" name="avatar" accept=".png, .jpg, .jpeg">
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-6">
                                <img style="max-height: 120px; display: none; display: inline-block" alt="avartar preview"
                                    id="avatarPreview"/>
                            </div>
                        </div>


                        <div class="d-flex w-full justify-content-between">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <a href="/admin/user" class="btn btn-primary">Back</a>
                        </div>
                    </form:form>
                </div>

            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>

<s
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>

</body>

</html>