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
                    <h3>Create a product</h3>
                    <form:form method="post" action="/admin/product/create"
                               modelAttribute="product"
                               enctype="multipart/form-data"
                    >
                        <c:set var="errorName"><form:errors path="name" cssClass="invalid-feedback"/></c:set>
                        <c:set var="errorPrice"><form:errors path="price" cssClass="invalid-feedback"/></c:set>
                        <c:set var="errorDetailDesc"><form:errors path="detailDesc" cssClass="invalid-feedback"/></c:set>
                        <c:set var="errorShortDesc"><form:errors path="shortDesc" cssClass="invalid-feedback"/></c:set>
                        <c:set var="errorQuantity"><form:errors path="quantity" cssClass="invalid-feedback"/></c:set>
                        <div class="row">
                            <div class="mb-3 col-sm-6">

                                <label class="form-label">Name</label>
                                <form:input type="text" path="name" class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                            aria-describedby="emailHelp"/>
                                ${errorName}
                            </div>
                            <div class="mb-3 col-sm-6">

                                <label for="price" class="form-label">Price</label>
                                <form:input type="number" path="price" class="form-control  ${not empty errorPrice? 'is-invalid' : ''}"/>
                                    ${errorPrice}
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-12 col-sm-12">

                                <label class="form-label">Detail description:</label>
                                <form:textarea type="text" path="detailDesc" class="form-control  ${not empty errorDetailDesc? 'is-invalid' : ''}"/>
                                    ${errorDetailDesc}
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-6">

                                <label class="form-label">Short desription</label>
                                <form:input type="shortDesc" path="shortDesc" class="form-control  ${not empty errorShortDesc? 'is-invalid' : ''}"/>
                                    ${errorShortDesc}
                            </div>
                            <div class="mb-3 col-sm-6">

                                <label for="quantity" class="form-label">Quantity</label>
                                <form:input type="text" path="quantity" class="form-control  ${not empty errorQuantity? 'is-invalid' : ''}"/>
                                    ${errorQuantity}
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-6">
                                <label class="form-label">Factory</label>
                                <form:select class="form-select" aria-label="Default select example" path="factory">
                                    <option value="ADMIN">LG</option>
                                    <option value="USER">SAMSUNG</option>
                                </form:select>
                            </div>
                            <div class="mb-3 col-sm-6">
                                <label for="quantity" class="form-label">Target</label>
                                <form:select class="form-select" aria-label="Default select example" path="target">
                                    <option value="ADMIN">Gaming</option>
                                    <option value="USER">Văn phòng</option>
                                </form:select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-6">
                                <label class="form-label">Avartar:</label>
                                <input type="file" class="form-control" id="avatarFile" name="imageProduct" accept=".png, .jpg, .jpeg">
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-6">
                                <img style="max-height: 120px; display: none;" alt="avartar preview"
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