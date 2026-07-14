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
    <title>Dashboard - Hỏi Dân IT</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script>
        // Chạy ngay khi trình duyệt vừa nạp xong giao diện
        document.addEventListener("DOMContentLoaded", function() {
            let originalName = document.getElementById("hiddenAvatar").value;
            let cleanName = originalName.replace(/\\/g, "");

            // Gán src để hiển thị ảnh lên màn hình update
            document.getElementById("view_img").src = "/images/image/" + encodeURIComponent(cleanName);
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
                    <div class="d-flex w-full justify-content-between mb-3">
                        <h3>View a product ${id}</h3>
                        <a href="/admin/product" class="btn btn-primary">Back</a>
                    </div>
                    <ul class="list-group m-2">
                        <li class="list-group-item active" aria-current="true">Name: ${product.name}</li>
                        <li class="list-group-item">Price: ${product.price}</li>
                        <li class="list-group-item">detailDesc: ${product.detailDesc}</li>
                        <li class="list-group-item">shortDesc: ${product.shortDesc}</li>
                    </ul>
                    <div >
                        <input type="hidden" id="hiddenAvatar" value="${product.image}" />
                        <img style="max-height: 250px; display: inline-block" alt="avartar preview" class="border border-dark rounded-3"
                             id="view_img" src=""
                        />
                    </div>
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