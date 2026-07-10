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
            document.getElementById("view_img").src = "/images/avatar/" + encodeURIComponent(cleanName);
        });
    </script>

</head>

<body >
 home page
</body>

</html>