<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Laptop shop</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script>
        // Chạy ngay khi trình duyệt vừa nạp xong giao diện
        $(document).ready(() => {
            let originalName = document.getElementById("hiddenAvatar").value;
            if (!originalName) return;
            let cleanName = originalName.replace(/\\/g, "");

            // Gán src để hiển thị ảnh lên màn hình update
            document.getElementById("view_img").src = "/images/avatar/" + encodeURIComponent(cleanName);
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                console.log("imgURL",imgURL);
                $("#view_img").attr("src", imgURL);
            });
        });
    </script>
</head>
<style>
    .conten_img{
        border: 2px solid #ccc !important;
        display: inline-block;
        padding: 5px;
        border-radius: 5%;
    }
</style>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="mx-auto container mt-4">
                <div class="row">
                    <h3>Edit a user</h3>
                    <form:form method="post" action="/admin/user/edit" modelAttribute="users"
                               enctype="multipart/form-data">
                        <div class="mb-3" style="display: none;">
                            <label class="form-label">ID</label>
                            <form:input type="text" path="id" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <form:input type="email" path="email" class="form-control" disabled="true" />
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
                        <div class="mb-3">
                            <label for="address" class="form-label">Avartar:</label>
                            <input type="file" class="form-control" id="avatarFile" name="avatar" accept=".png, .jpg, .jpeg">
                        </div>
                        <span class="mb-3 conten_img">
                            <form:hidden path="avartar" id="hiddenAvatar" />
                            <img style="max-height: 120px" alt="avartar preview"
                                 id="view_img" src=""
                            />
                        </span>

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

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>


<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>

</body>

</html>